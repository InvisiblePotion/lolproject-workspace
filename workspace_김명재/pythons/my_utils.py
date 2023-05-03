import cx_Oracle as ora
import pandas as pd
import requests
from urllib import parse
from tqdm import tqdm
import time
import random
from PIL import Image
from io import BytesIO
import numpy as np
import warnings


class BadApiResult(Exception):
    def __init__(self, request_result: requests.Response):
        super().__init__(f"사용한 API로부터 비정상적인 리턴을 받았습니다.\
                         \n상태 코드: {request_result.status_code}\
                         \n사용된 URL: {request_result.url}")


class InvaildApiKey(Exception):
    def __init__(self, request_result: requests.Response):
        super().__init__(f"사용된 API Key가 유효하지 않습니다.\
                         \n사용된 API Key: {request_result.url[request_result.url.find('api_key') + 8:]}")


warnings.filterwarnings('ignore')

dsn = ora.makedsn('192.168.0.140', 1521, 'xe')


db = None
cursor = None
seoul_api_key = None


def db_open(debug_print: bool=False):
    global db
    global cursor
    db = ora.connect(user='PERSONLOL', password='1234', dsn=dsn)
    cursor = db.cursor()
    if debug_print: print('oracle open!')


def oracle_execute(query: str, use_pandas: bool=True, debug_print: bool=False):
    global db
    global cursor
    try:
        if 'SELECT ' in query.upper():
            if use_pandas:
                df = pd.read_sql(sql=query, con=db)
                return df
            return cursor.execute(query).fetchall()
        cursor.execute(query)
        if debug_print: print('oracle 쿼리 성공!')
        return
    except Exception as e:
        print(e)


def oracle_close(debug_print: bool=False):
    global db
    db.commit()
    cursor.close()
    db.close()
    if debug_print: print('oracle close!')


def oracle_totalExecute(query: str, use_pandas: bool=True, debug_print: bool=True):
    db_open(debug_print)
    result = oracle_execute(query, use_pandas, debug_print)
    oracle_close(debug_print)
    return result


def getPuuidBySummonerName(summoner_name: str, api_key: str):
    return requests.get(f"https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/{parse.quote(summoner_name)}?api_key={api_key}").json()['puuid']


def getMatchIdsByPuuid(puuid: str, api_key: str, count: int=10):
    return requests.get(f"https://asia.api.riotgames.com/lol/match/v5/matches/by-puuid/{puuid}/ids?start=0&count={count}&type=ranked&api_key={api_key}").json()


def getMatchDataByMatchIds(match_ids: list, api_key: str, index: int=0):
    return requests.get(f"https://asia.api.riotgames.com/lol/match/v5/matches/{match_ids[index]}?api_key={api_key}").json()


def getMatchTimelineDataByMatchIds(match_ids: list, api_key: str, index: int=0):
    return requests.get(f"https://asia.api.riotgames.com/lol/match/v5/matches/{match_ids[index]}/timeline?api_key={api_key}").json()


def getMatchDataAndTimelineByMatchId(match_id: str, api_key: str):
    match_data = requests.get(f"https://asia.api.riotgames.com/lol/match/v5/matches/{match_id}?api_key={api_key}").json()
    match_timeline = requests.get(f"https://asia.api.riotgames.com/lol/match/v5/matches/{match_id}/timeline?api_key={api_key}").json()
    return match_data, match_timeline


def getMatchDataByName(summoner_name: str, api_key: str, get_count: int=10, match_index: int=0):
    puuid = getPuuidBySummonerName(summoner_name, api_key)
    match_ids = getMatchIdsByPuuid(puuid, api_key, get_count)
    match_data = getMatchDataByMatchIds(match_ids, api_key, match_index)
    match_timeline = getMatchTimelineDataByMatchIds(match_ids, api_key, match_index)
    return {'match_data': match_data, 'match_timeline': match_timeline}


# 가공된 DTO 형태의 데이터프레임을 데이터베이스 테이블에 삽입해주는 함수
def insertDataFrameIntoTable(data_frame: pd.DataFrame, table_name: str, debug_print: bool=True):
    # 테이블 명 대문자 아니면 에러남
    table_name = table_name.upper()
    
    # 데이터를 삽입 할 테이블의 컬럼에 대한 정보를 가져옴. (데이터 타입 검사 목적)
    ## 컬럼ID 기준으로 인덱스 정렬을 안하면 가끔 컬럼 순서가 꼬인다.
    if debug_print: print('>>> 테이블의 컬럼 정보 검색 중...')
    try:
        tab_col = oracle_totalExecute(f"SELECT * FROM ALL_TAB_COLUMNS WHERE TABLE_NAME = '{table_name}'", debug_print=False)\
            .sort_values('COLUMN_ID', ignore_index=True)
    except:
        print('>>> Exception: 테이블 컬럼 정보 검색 실패!! (추정: 테이블 명 입력 오류 또는 db 접속 실패)')
        return
    
    # MERGE를 이용한 중복 검사를 위한 기본키(조합키) 검색
    if debug_print: print('>>> 테이블의 Primary Key 정보 검색 중...')

    # 테이블의 PK 정보를 조회하는 쿼리
    pk_col_execute = f"""
        SELECT COLUMN_NAME
        FROM USER_CONS_COLUMNS
        WHERE CONSTRAINT_NAME = (SELECT CONSTRAINT_NAME
                                 FROM ALL_CONSTRAINTS
                                 WHERE TABLE_NAME = '{table_name}'
                                 AND CONSTRAINT_TYPE = 'P')"""
    pk_col = [val for val in \
              oracle_totalExecute(pk_col_execute, debug_print=False)['COLUMN_NAME']]
    # MERGE의 UPDATE를 위해 SET 컬럼 생성
    all_col = [col.upper() for col in data_frame.columns]
    set_col = [col for col in enumerate(all_col)]
    for pcol in pk_col:
        set_col.remove((all_col.index(pcol), pcol))

    db_open(debug_print=False)
    # 데이터 삽입 시작
    if debug_print:
        print('>>> 테이블에 데이터 삽입 중...')
        table_iter = tqdm(range(len(data_frame)))
    else:
        table_iter = range(len(data_frame))
    for rec_idx in table_iter:
        values = []
        dual_on_cv = []

        # values 변수에 sql의 values()에 쓰일 모든 값을 담는다
        for col_idx in range(len(data_frame.iloc[rec_idx])):
            try:
                # 타입이 NUMBER거나 FLOAT라면 '를 붙이지 않는다.
                if (tab_col['DATA_TYPE'][col_idx] == 'NUMBER') or (tab_col['DATA_TYPE'][col_idx] == 'FLOAT'):
                    values.append(str(data_frame.iloc[rec_idx][col_idx]))
                    if all_col[col_idx] in pk_col:
                        dual_on_cv.append(all_col[col_idx] + '=' + str(data_frame.iloc[rec_idx][col_idx]))
                # 숫자가 아니라면 값 내부의 ' 기호를 오라클용 이스케이프 문인 '' 기호로 변경한 뒤 좌우를 '로 감싸준다.
                else:
                    if str(data_frame.iloc[rec_idx][col_idx]) == 'DEFAULT':
                        values.append(str(data_frame.iloc[rec_idx][col_idx]))
                    else: values.append('\'' + str(data_frame.iloc[rec_idx][col_idx]).replace('\'', '\'\'') + '\'')
                    if all_col[col_idx] in pk_col:
                        dual_on_cv.append(all_col[col_idx] + '=' + ('\'' + str(data_frame.iloc[rec_idx][col_idx]).replace('\'', '\'\'') + '\''))
            except:
                print(f'''>> Warning: {rec_idx}번째 레코드의 {col_idx}번째 컬럼 값 삽입 실패. 해당 컬럼 스킵.
                    (추정: 값과 컬럼 타입 불일치. 함수 수정 필요.)''')
                values.append('INERR')
                continue

        # 기본키가 없다면 INSERT, 있다면 MERGE를 수행
        if pk_col == []:
            execute = f"INSERT INTO {table_name} values({', '.join(values)})"
        else: 
            execute = f"""
                MERGE
                INTO {table_name}
                USING DUAL ON ({' and '.join(dual_on_cv)})
                WHEN NOT MATCHED THEN INSERT VALUES({', '.join(values)})
                WHEN MATCHED THEN UPDATE SET 
            """
            set_val = []
            for sc in set_col:
                set_val.append(f"{sc[1]}={values[sc[0]]}")
            execute += ', '.join(set_val)
        # print(execute)
        oracle_execute(execute)
    oracle_close(debug_print=False)
    if debug_print: print('>>> 처리 완료!')


##### << 재활용 가능한 함수로 수정 필요! >> #####
# getRawdata()로 만든 데이터프레임을 원하는 데이터베이스 테이블에 삽입하기 위해
#:DTO 형태로 가공하여 데이터프레임으로 리턴하는 함수
def convertRawDataToDTO(df: pd.DataFrame):
    cols_match_df = [
        'gameId', 'gameDuration',
        'summonerName', 'participantId', 'championName',
        'teamPosition', 'teamId', 'win',
        'kills', 'deaths', 'assists',
        'totalDamageDealtToChampions', 'totalDamageTaken',
        'enemyMissingPings', 'epicMonsterSteals'
    ]

    new_cols = cols_match_df + [
        'g_5','g_7','g_9','g_11','g_13',
        'g_15','g_17','g_19','g_21','g_23','g_25'
    ]
    
    match_df = []
    for rec in df.iloc:
        if rec['matches']['info'][cols_match_df[1]] < 900:
            continue
        for idx, part in enumerate(rec['matches']['info']['participants']):
            # 'gameId'
            match_df.append([rec['match_id']])

            # 'gameDuration'
            match_df[-1].append(rec['matches']['info'][cols_match_df[1]])

            # 'summonerName' ~ 'enemyMissingPings'
            for col_part in cols_match_df[2:-1]:
                match_df[-1].append(part[col_part])

            # 'epicMonsterSteals'
            match_df[-1].append(part['challenges'][cols_match_df[-1]])

            # 'g_5' ~ 'g_25'
            for col_gold in range(5, 26, 2):
                try:
                    match_df[-1].append(rec['timeline']['info']['frames'][col_gold]['participantFrames'][str(idx+1)]['totalGold'])
                except IndexError:
                    match_df[-1].append(0)

    new_df = pd.DataFrame(match_df, columns=new_cols)
    return new_df


# LOL API의 접속 제한을 기다리기 위한 반복 슬립 함수 (100req per 120s)
def apiSleep(slp_time: int=120, print_msg: bool=True):
    if print_msg:
        iter = tqdm(range(slp_time), desc='api key 쿨타임 대기중...')
    else:
        iter = range(slp_time)
    for slp in iter:
        time.sleep(1)


# LOL API에서 원하는 티어에서 랜덤으로 60게임에 대한 게임 정보와 타임라인 정보를 묶어 데이터프레임으로 리턴하는 함수
def getRawdata(tier: str, riot_api_key: str):

    tier = tier.upper()
    # division 리스트와 page를 랜덤으로 뽑아올 함수를 사용하기 lst 리스트도 만들어두기
    division_list = ['I','II','III','IV']
    lst = []
    page = random.randrange(1,100)
    
    # riot api를 통해서 summonerName을 가져오기
    print('get SummonerName.....')
    for division in tqdm(division_list):
        url = f'https://kr.api.riotgames.com/lol/league/v4/entries/RANKED_SOLO_5x5/{tier}/{division}?page={page}&api_key={riot_api_key}'
        res = requests.get(url).json()
        if len(res) >= 5: lst += random.sample(res, 5)
        else: lst += [a for a in res]

    # summonerName을 통해서 puuid 가져오기
    summonerName_lst = list(map(lambda x:x['summonerName'] ,lst))
    
    print('get puuid......')
    puuid_lst = []
    skip_count = 0
    for n in tqdm(summonerName_lst):
        try:
            puuid_lst.append(getPuuidBySummonerName(n, riot_api_key))
        except:
            skip_count += 1
            continue
    print('passed player: ', skip_count)
    
    # match_ids 가져오기
    print('get match_id...')
    match_id_lst = []
    for p in tqdm(puuid_lst):
        match_id_lst.extend(getMatchIdsByPuuid(p, riot_api_key, 3))

    # match,timeline rawdata - (match_id, matches, timelines) df만들기
    df_create = []
    print('get matches & timeline: 1~20.....')
    for match_id in tqdm(match_id_lst[:20]): 
        matches,timeline = getMatchDataAndTimelineByMatchId(match_id, riot_api_key)
        df_create.append([match_id ,matches,timeline])

    # api 리퀘스트 횟수 충전 대기
    apiSleep(100)

    print('get matches & timeline: 21~60.....')
    for match_id in tqdm(match_id_lst[20:]): 
        matches,timeline = getMatchDataAndTimelineByMatchId(match_id, riot_api_key)
        df_create.append([match_id ,matches,timeline])
    
    df = pd.DataFrame(df_create, columns = ['match_id','matches','timeline'])
    print('complete!')
    return df


def getSampleData(tier: str, division: int, get_amount: int, riot_api_key: str):
    if division not in [1,2,3,4]:
        err_msg = '에러>> [파라미터 입력 에러]: \'division\' 값은 1~4 이어야 합니다.'
        print(err_msg)
        return 'getSampleData() ' + err_msg
    tier = tier.upper()
    division_list = ['I','II','III','IV']

    page = random.randrange(1, 100)
    summonerName_lst = []

    # riot api를 통해서 summonerName을 가져오기
    print('get SummonerName.....')
    for v in tqdm(range(get_amount)):
        url = f'https://kr.api.riotgames.com/lol/league/v4/entries/RANKED_SOLO_5x5/{tier}/{division_list[division+1]}?page={page}&api_key={riot_api_key}'
        res = requests.get(url).json()
        summonerName_lst.append(random.sample(res, 1)[0]['summonerName'])

    print('total player: ', len(summonerName_lst))

    # puuid 가져오기
    print('get puuid......')
    puuid_lst = []
    skip_count = 0
    for n in tqdm(summonerName_lst):
        try:
            puuid_lst.append(getPuuidBySummonerName(n, riot_api_key))
        except:
            skip_count += 1
            continue
    print('passed player: ', skip_count)

    # match_ids 가져오기
    print('get match_id...')
    match_id_lst = []
    for p in tqdm(puuid_lst):
        match_id_lst.extend(getMatchIdsByPuuid(p, riot_api_key, 1))

    # match,timeline rawdata - (match_id, matches, timelines) df만들기
    print('get matches & timeline.....')
    df_create = []
    idx = 0
    with tqdm(total=len(match_id_lst)) as progress:
        while idx < len(match_id_lst):
            matches, timeline = getMatchDataAndTimelineByMatchId(match_id_lst[idx], riot_api_key)
            # API Key 제한수 초과시 2분 휴식
            try:
                is_max = matches['metadata']
                df_create.append([match_id_lst[idx] , matches, timeline])
            except:
                print('Rate Limit Exceeded: ', idx)
                apiSleep(120)
                continue
            idx += 1
            progress.update(1)

    print('complete!')
    return pd.DataFrame(df_create, columns=['match_id','matches','timeline'])


def RawdataFirstFilter(rawdata: pd.DataFrame):
    """
    RawData를 1차 정제 형태로 변환해주는 함수
    """
    result = []
    for game in rawdata.iloc:
        for i in range(10):
            matches = game['matches']['info']
            part = matches['participants'][i]
            challenge = part['challenges']
            # timeline에서 어떤 데이터를 뽑을지 아직 미정
            # timeline = rawdata['timeline']['info']
            # frames = timeline['frames']

            each_part = {
                'version': matches['gameVersion'],
                'game_create_time': matches['gameCreation'],
                'game_id': game['matches']['metadata']['matchId'],
                'participant_number': part['participantId'],
                'participant_puuid': part['puuid'],
                'matches': {
                    'game': {
                        'gameCreation': matches['gameCreation'],
                        'gameStartTimestamp': matches['gameStartTimestamp'],
                        'gameEndTimestamp': matches['gameEndTimestamp'],
                        'gameDuration': matches['gameDuration'],
                        'gameVersion': matches['gameVersion'],
                        'queueId': matches['queueId'],
                        'bans': matches['teams'][0]['bans'] + matches['teams'][1]['bans']
                    },
                    'summoner': {
                        'summonerName': part['summonerName'],
                        'summonerLevel': part['summonerLevel'],
                        'summonerId': part['summonerId'],
                        'puuid': part['puuid']
                    },
                    'champion': {
                        'championId': part['championId'],
                        'championName': part['championName'],
                        'champLevel': part['champLevel'],
                        'lane': part['lane'],
                        'individualPosition': part['individualPosition'],
                        'teamPosition': part['teamPosition'],
                        'teamId': part['teamId'],
                        'win': part['win']
                    },
                    'spell': {
                        'summoner1Id': part['summoner1Id'],
                        'summoner2Id': part['summoner2Id']
                    },
                    'rune': {
                        'runePrimaryStyle': part['perks']['styles'][0]['style'],
                        'runeCorePerk': part['perks']['styles'][0]['selections'][0]['perk'],
                        'runePrimaryPerk1': part['perks']['styles'][0]['selections'][1]['perk'],
                        'runePrimaryPerk2': part['perks']['styles'][0]['selections'][2]['perk'],
                        'runePrimaryPerk3': part['perks']['styles'][0]['selections'][3]['perk'],
                        'runeSubStyle': part['perks']['styles'][1]['style'],
                        'runeSubPerk1': part['perks']['styles'][1]['selections'][0]['perk'],
                        'runeSubPerk2': part['perks']['styles'][1]['selections'][1]['perk'],
                        'runeShardOffense': part['perks']['statPerks']['offense'],
                        'runeShardFlex': part['perks']['statPerks']['flex'],
                        'runeShardDefense': part['perks']['statPerks']['defense']
                    },
                    'item': {
                        'item0': part['item0'],
                        'item1': part['item1'],
                        'item2': part['item2'],
                        'item3': part['item3'],
                        'item4': part['item4'],
                        'item5': part['item5'],
                        'item6': part['item6']
                    },
                    'kda': {
                        'kills': part['kills'],
                        'deaths': part['deaths'],
                        'assists': part['assists'],
                        'kda': challenge['kda'],
                        'killParticipation': challenge['killParticipation']
                    },
                    'gold': {
                        'bountyLevel': part['bountyLevel'],
                        'bountyGold': challenge['bountyGold'],
                        'goldEarned': part['goldEarned'],
                        'goldPerMinute': challenge['goldPerMinute']
                    },
                    'cs': {
                        'totalMinionsKilled': part['totalMinionsKilled'],
                        'laneMinionsFirst10Minutes': challenge['laneMinionsFirst10Minutes']
                    },
                    'turret': {
                        'turretTakedowns': challenge['turretTakedowns'],
                        'turretPlatesTaken': challenge['turretPlatesTaken']
                    },
                    'damage': {
                        'teamDamagePercentage': challenge['teamDamagePercentage'],
                        'totalDamageDealtToChampions': part['totalDamageDealtToChampions'],
                        'physicalDamageDealtToChampions': part['physicalDamageDealtToChampions'],
                        'magicDamageDealtToChampions': part['magicDamageDealtToChampions'],
                        'trueDamageDealtToChampions': part['trueDamageDealtToChampions'],
                        'damageDealtToBuildings': part['damageDealtToBuildings'],
                        'damageDealtToObjectives': part['damageDealtToObjectives'],
                        'totalDamageTaken': part['totalDamageTaken'],
                        'physicalDamageTaken':part['physicalDamageTaken'],
                        'magicDamageTaken': part['magicDamageTaken'],
                        'trueDamageTaken': part['trueDamageTaken'],
                        'totalHeal': part['totalHeal'],
                        'totalHealsOnTeammates': part['totalHealsOnTeammates']
                    },
                    'vision': {
                        'visionScore': part['visionScore'],
                        'wardsPlaced': part['wardsPlaced'],
                        'controlWardsPlaced': challenge['controlWardsPlaced'],
                        'wardsKilled': part['wardsKilled']
                    },
                    'etc': {
                        'spell1Casts': part['spell1Casts'],
                        'spell2Casts': part['spell2Casts'],
                        'spell3Casts': part['spell3Casts'],
                        'spell4Casts': part['spell4Casts'],
                        'firstBloodKill': part['firstBloodKill'],
                        'largestKillingSpree': part['largestKillingSpree'],
                        'largestMultiKill': part['largestMultiKill']
                        ## 230503: 이유는 몰라도 이 데이터가 없는 데이터가 있었다... 일단 제거
                        # 'earlyLaningPhaseGoldExpAdvantage': challenge['earlyLaningPhaseGoldExpAdvantage']
                    }
                },
                'timeline': {
                    '제조 필요!': '어떤 정보를 넣을지 의논 필요'
                }
            }
            result.append(each_part)
    return result


def autoInsert(riot_api_key: str, start_page: int=1, debug: bool=False):
    """
    하나의 API Key로 DB에 1차 정제 데이터를 지속 삽입하는 함수
    """

    # 사이클 순환 정보를 위한 변수
    cycle_count = 1 # 사이클 회전 수
    inserted_player = 0 # 삽입된 Summoner 수
    inserted_game = 0 # 삽입된 RawData 수

    # API 연결 상태 디버깅용 변수
    api_nonlimit_request_count = 0 # RIOT API의 정상 리턴이나 리미트 초과가 아닌 비정상 리턴의 횟수
    api_sleep_count = 0 # 리미트 초과로 발생 횟수
    api_error_count = 0 # API의 비정상 리턴 횟수

    def checkApiResult(url: str):
        """
        `request.get()`의 결과에 따라서 API Key를 교체하거나 에러 메시지를 출력하고
        에러인 경우 `False`를 리턴하여 `if`가 걸린 부분의 `continue` 트리거를 작동시키는 `autoInsert()` 전용 내부 함수
        """
        nonlocal api_nonlimit_request_count
        nonlocal api_sleep_count
        nonlocal api_error_count
        is_sleep = False
        
        try:
            while True:
                api_nonlimit_request_count += 1
                result = requests.get(url+riot_api_key)

                # 리턴이 정상인 경우 json 형태로 리턴
                if result.status_code == 200:
                    if is_sleep: api_sleep_count += 1
                    return result.json()
                
                # 리미트 초과인 경우 10초 휴식 후 재시도
                elif result.status_code == 429:
                    api_nonlimit_request_count -= 1
                    is_sleep = True
                    apiSleep(10, False)
                    continue

                # 만료 되었거나 불량인 API key 사용시 API key 관련 에러문 출력
                elif result.status_code == 403:
                    raise InvaildApiKey(result)
                
                # 리턴의 상태 코드가 200, 429, 403이 아닌 경우 예외로 간주하고 API 관련 에러문 출력 출력
                else:
                    raise BadApiResult(result)

        # 위에서 발생된 모든 예외를 캐치하여 API 관련 에러 카운트를 1 올리고 False를 리턴(continue 트리거 작동)
        except Exception as e:
            api_error_count += 1
            if is_sleep: api_sleep_count += 1
            print(f"{type(e).__name__}:\n{e}")
            return False

    # 검색 할 랭크 리스트
    rank_tier_list = [
        {'tier': 'PLATINUM', 'rank': 'IV', 'page': start_page, 'pageCycle': 0},
        {'tier': 'PLATINUM', 'rank': 'III', 'page': start_page, 'pageCycle': 0},
        {'tier': 'PLATINUM', 'rank': 'II', 'page': start_page, 'pageCycle': 0},
        {'tier': 'PLATINUM', 'rank': 'I', 'page': start_page, 'pageCycle': 0},
        {'tier': 'DIAMOND', 'rank': 'IV', 'page': start_page, 'pageCycle': 0},
        {'tier': 'DIAMOND', 'rank': 'III', 'page': start_page, 'pageCycle': 0},
        {'tier': 'DIAMOND', 'rank': 'II', 'page': start_page, 'pageCycle': 0},
        {'tier': 'DIAMOND', 'rank': 'I', 'page': start_page, 'pageCycle': 0}
    ]

    # Summoner 테이블의 컬럼 리스트
    summoner_table_cols = [
        'summoner_id',
        'summoner_puuid',
        'summoner_name',
        'summoner_level',
        'summoner_profile',
        'summoner_tier',
        'summoner_wins',
        'summoner_losses',
        'summoner_veteran',
        'summoner_inactive',
        'summoner_freshblood',
        'summoner_hotstreak']
    
    # Summoner 테이블의 일반 정보 키 리스트
    normal_data_keys = ['id', 'puuid', 'name', 'summonerLevel', 'profileIconId']

    # Summoner 테이블의 랭크 관련 정보 키 리스트
    rank_data_keys = ['tier', 'wins', 'losses', 'veteran', 'inactive', 'freshBlood', 'hotStreak']

    print(f"<<< autoInsert() 시작 >>>\
          \nStart Time: {time.strftime('%Y-%m-%d %H:%M:%S')}\n")

    # 수동 중단시까지 무한 반복
    while True:

        # 현재 rank_tier_list의 모든 랭크 티어를 순환
        for this_rank_idx, this_rank in enumerate(rank_tier_list):
            tier, rank, page = this_rank['tier'], this_rank['rank'], this_rank['page']
            
            print(f"<<< 새 랭크 티어 입력 시작 >>>\
                    \n현재 시간: {time.strftime('%Y-%m-%d %H:%M:%S')}\
                    \n반복 횟수: {cycle_count}\
                    \n현재 랭크 티어: {tier} {rank}\
                    \n현재 페이지: {page}\
                    \n입력된 총 플레이어 수: {inserted_player}\
                    \n입력된 총 게임 수: {inserted_game}\
                    \nRIOT API 총 사용 횟수: {api_nonlimit_request_count}\
                    \nRIOT API 휴식 횟수: {api_sleep_count}\
                    \nRIOT API 에러 횟수: {api_error_count}\
                    \n==============================")

            # 현재 랭크 티어의 'page'번째 페이지의 모든 유저 정보를 획득
            print(f"{tier} {rank}의 {page}번 페이지 가져오는 중......")
            if (summoner_page := checkApiResult(f"https://kr.api.riotgames.com/lol/league/v4/entries/RANKED_SOLO_5x5/{tier}/{rank}?page={page}&api_key=")) is False: continue

            # 가져온 페이지의 유저 수가 10명 미만이라면 현재 랭크 티어의 모든 페이지를 탐색 한것으로 간주하고 현재 랭크 티어의 page를 1로 초기화
            if len(summoner_page) < 10:
                print('!!! 페이지를 전부 소진한 랭크 티어 발생 !!!')
                rank_tier_list[this_rank_idx]['page'] = 1
                rank_tier_list[this_rank_idx]['pageCycle'] += 1
                print(f"!!! {tier} {rank}의 page를 1로 초기화합니다. !!!")
                continue

            # 가져온 페이지에서 무작위 10명을 골라 summonerId의 리스트와 Summoner 테이블에 필요한 랭크 관련 데이터 리스트를 생성
            sample_summoner = random.sample(summoner_page, 10)
            summoner_id_list = [a['summonerId'] for a in sample_summoner]
            summoner_rank_data_list = [[v[i] for i in rank_data_keys] for v in sample_summoner]

            # 랭크 관련 데이터의 bool 값을 0,1로 변환
            for v in summoner_rank_data_list:
                for i in range(3, 7):
                    if v[i]: v[i] = 1
                    else: v[i] = 0

            # 획득한 summoner_id_list로 추출 및 삽입 작업 시작
            print(f"페이지의 유저 데이터 추출 및 삽입......")
            for summoner_id_idx, summoner_id in enumerate(summoner_id_list):

                # 소환사 상세 정보 획득
                # (summonerId로 조회하는 데이터는 가끔 []를 반환하는 경우가 있는데, 해당 유저가 블랙리스트 처리 된 것으로 추정된다.)
                # (따라서 이러한 유저는 이 구간에서는 continue로 스킵하며 게임 데이터 내부에서 발견된 경우에만 존재하는 데이터만으로 삽입한다.)
                if (summoner_detail := checkApiResult(f"https://kr.api.riotgames.com/lol/summoner/v4/summoners/{summoner_id}?api_key=")) is False: continue
                if summoner_detail == []: continue
                
                # Summoner 테이블에 필요한 일반 데이터 추출
                summoner_normal_data = [summoner_detail[i] for i in normal_data_keys]
                
                # 소환사 정보로 Summoner 테이블 갱신
                if not debug: insertDataFrameIntoTable(pd.DataFrame([summoner_normal_data + summoner_rank_data_list[summoner_id_idx]], columns=summoner_table_cols), 'SUMMONER', debug_print=False)
                inserted_player += 1

                # 현재 puuId로부터 가장 최근의 20게임의 matchId를 획득
                if (match_id_list := checkApiResult(f"https://asia.api.riotgames.com/lol/match/v5/matches/by-puuid/{summoner_normal_data[1]}/ids?start=0&count=20&type=ranked&api_key=")) is False: continue
                print(f"\t'{summoner_normal_data[2]}': 유저의 게임 정보 추출 및 삽입......")
                for match_id in match_id_list:

                    # RawData 테이블에 현재 match_id가 이미 존재한다면 리스트에서 제거 후 continue
                    if 0 != oracle_totalExecute(f"SELECT COUNT(game_id) FROM RAWDATA WHERE game_id = '{match_id}'", use_pandas=False, debug_print=False)[0][0]:
                        match_id_list.remove(match_id)
                        continue
                    
                    # 현재 matchId의 matches와 timeline을 획득
                    match_raw = {
                        'matches': checkApiResult(f"https://asia.api.riotgames.com/lol/match/v5/matches/{match_id}?api_key="),
                        'timeline': checkApiResult(f"https://asia.api.riotgames.com/lol/match/v5/matches/{match_id}/timeline?api_key=")}
                    if True in [v is False for v in match_raw.values()]: continue

                    # RawData 테이블 형태로 가공하여 게임 데이터 리스트에 추가
                    filterd_match_raw = RawdataFirstFilter(pd.DataFrame([match_raw]))

                    # 현재 게임에 참가중인 모든 플레이어의 puuid 추출후 중복을 방지하기 위해 현재 유저만 제거
                    match_puuid_list = match_raw['matches']['metadata']['participants']
                    match_puuid_list.remove(summoner_normal_data[1])

                    # 현재 게임의 소환사 데이터 저장용 리스트
                    match_part_summoner_data_list = []

                    # 현재 게임에서 9명의 puuid로 Summoner 테이블에 필요한 정보를 추출 및 삽입
                    print(f"\t\t'{match_id}': 게임 참여자의 유저 정보 추출 및 삽입......")
                    for part_puuid in match_puuid_list:

                        # puuid로 소환사 정보 획득
                        if (part_summoner_detail := checkApiResult(f"https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-puuid/{part_puuid}?api_key=")) is False: continue
                        part_summoner_normal_data = [part_summoner_detail[i] for i in normal_data_keys]
                        
                        # summonerId로 랭크 관련 정보 획득
                        if (part_rank_detail := checkApiResult(f"https://kr.api.riotgames.com/lol/league/v4/entries/by-summoner/{part_summoner_normal_data[0]}?api_key=")) is False: continue
                       
                        # 이 유저가 솔랭에서 언랭 혹은 배치이면서 다른 랭크 데이터가 전혀 없다면 디폴트로 삽입
                        if part_rank_detail == []:
                            part_summoner_rank_data = ['DEFAULT' for i in rank_data_keys]

                        # 이 유저가 솔랭에서 언랭 혹은 배치이면서 다른 랭크 데이터가 있다면 필요한 랭크 데이터가 없기 때문에 디폴트로 삽입
                        elif not True in (is_solo_rank_list := [a['queueType'] == 'RANKED_SOLO_5x5' for a in part_rank_detail]):
                            part_summoner_rank_data = ['DEFAULT' for i in rank_data_keys]

                        # summonerId의 정상 여부 확인 후 솔랭 데이터만 찾기
                        else:
                            part_solo_rank_detail = part_rank_detail[is_solo_rank_list.index(True)]
                            part_summoner_rank_data = [part_solo_rank_detail[i] for i in rank_data_keys]

                        # 랭크 관련 정보의 bool 값을 0,1로 변환
                        for idx in range(3, 7):
                            if part_summoner_rank_data[idx]: part_summoner_rank_data[idx] = 1
                            else: part_summoner_rank_data[idx] = 0

                        # 9명의 정보를 현재 게임의 소환사 정보 리스트에 추가
                        match_part_summoner_data_list.append(part_summoner_normal_data + part_summoner_rank_data)
                    
                    # 현재 게임의 게임 데이터와 유저 데이터 전부 확인 후 삽입
                    if not debug: insertDataFrameIntoTable(pd.DataFrame(filterd_match_raw), 'RAWDATA', debug_print=False)
                    inserted_game += 1
                    if not debug: insertDataFrameIntoTable(pd.DataFrame(match_part_summoner_data_list, columns=summoner_table_cols), 'SUMMONER', debug_print=False)
                    inserted_player += len(match_part_summoner_data_list)

            # 매 사이클 종료시 변수 후처리
            rank_tier_list[this_rank_idx]['page'] += 1
            cycle_count += 1


# getRawdata() 함수로 만들어진 데이터프레임 안에서 특정 챔피언의 등장 횟수와 등장 레코드를 리턴하는 함수
def findChampInRawData(raw_data: pd.DataFrame, champ_name: str='', champ_id: int=0):

    # 두 파라미터 모두 입력되지 않거나 모두 입력된 경우에 대한 에러 처리
    if ((champ_name=='') and (champ_id==0)) or ((champ_name!='') and (champ_id!=0)):
        print('에러>> [파라미터 입력 에러]: 챔피언 이름(str)이나 챔피언 ID(int) 두 파라미터 중 하나를 입력해야 합니다.')
        return
    if raw_data.__class__ != pd.DataFrame().__class__:
        print('에러>> [파라미터 입력 에러]: raw_data(pandas.DataFrame())의 타입이 DataFrame()이 아닙니다. 입력한 값을 확인해주세요.')
        return
    # champ_name에 str이 아닌 값이 들어온 경우에 대한 에러 처리
    if champ_name.__class__ != str().__class__:
        print('에러>> [파라미터 입력 에러]: 챔피언 이름(str)의 타입이 str이 아닙니다. 입력한 값을 확인해주세요.')
        return
    # champ_id에 int가 아닌 값이 들어온 경우에 대한 에러 처리
    if champ_id.__class__ != int().__class__:
        print('에러>> [파라미터 입력 에러]: 챔피언 ID(int)의 타입이 int가 아닙니다. 입력한 값을 확인해주세요.')
        return

    
    # champ_name으로 champ_id를 가져오는 과정에 대한 에러 핸들러
    def champidSelectErrorHandler(cid_df):
        
        cid_df_len = len(cid_df)
         # 챔피언 이름이 데이터베이스에 존재하지 않는 경우에 대한 에러 처리
        if cid_df_len == 0:
            print(f'에러>> [파라미터 입력 에러]: 챔피언 이름="{champ_name}"에 해당하는 레코드가 데이터베이스 상에 존재하지 않습니다.')
            return True
        # 챔피언 이름에 대한 레코드가 중복 존재하는 경우에 대한 에러 처리
        elif cid_df_len > 1:
            print(f'에러>> [데이터베이스 에러]: 챔피언 이름="{champ_name}"에 해당하는 레코드가 중복으로 존재합니다!\n\t\
                  데이터베이스의 수정이 필요합니다.')
            return True
        # my_utils의 함수나 데이터베이스 접속에 대한 문제로 예측되는 경우에 대한 에러 처리
        elif cid_df_len != 1:
            print(f'에러>> [원인 불명]: my_utils.py의 oracle_totalExecute()를 통한 검색에 문제가 있습니다.\n\t\
                  데이터베이스 접속에 문제가 있거나 my_utils.py 파일의 함수에 대한 수정이 필요합니다.\n\t\
                  에러 원인: cid_df_len={cid_df_len}')
            return True
        return False
    
    # champ_name이 입력된 경우 데이터베이스를 참조해 champ_id를 가져옴
    if champ_name != '':
        cid_df = oracle_totalExecute(f'SELECT championid FROM CHAMPION_NAME_KR WHERE champion_name_kr = \'{champ_name}\'', debug_print=False)
        # 에러 핸들러에서 에러가 감지된 경우 여기서 강제 리턴
        if champidSelectErrorHandler(cid_df):
            return
        champ_id = cid_df.iloc[0].values[0]

    # 예측하기 힘든 데이터프레임에 대한 예외 처리
    try:
        return list(filter(lambda x: x[1]==champ_id,\
            [(i, v['championId']) for i,v in enumerate(sum([a['matches']['info']['participants'] for a in raw_data.iloc], []))]))
    except:
        print('에러>> [파라미터 입력 에러]: raw_data의 값이 my_utils.getRawdata() 함수로 만들어진 데이터프레임이 아닌 것 같습니다.\n\t\
              raw_data를 my_utils.getRawdata() 함수로 만들어서 입력해 주시기 바랍니다.')


##### << 예외 처리 구문 작성 필요! >> #####
def eventExtractor(raw_data_series: pd.Series, event_type: str):
    return list(filter(lambda evt: (evt['type']==event_type),\
            sum([fr['events'] for fr in [ti for ti in raw_data_series['timeline']['info']['frames']]], [])))


# timeline 데이터에서 이 게임 동안 발생한 모든 이벤트의 타입을 리스트로 리턴하는 함수
def getEventList(timeline: dict):
    return list(set([b['type'] for b in sum([a['events'] for a in timeline['info']['frames']], [])]))


def cos_sim(a_v: np.ndarray, b_v: np.ndarray):
    return np.dot(a_v, b_v) / (np.linalg.norm(a_v) * np.linalg.norm(b_v))


def get_grey_img(file_name: str):
    return Image.open(BytesIO(
        open(f'./champion_image/{file_name}', 'rb').read()
    )).convert('L')


def img2vec(img: Image.Image):
    return (arr := np.asarray(img, dtype=int)).reshape(arr.shape[0] * arr.shape[1])


def get_all_cos_sim(champion_file_lst: list):
    vec_compare_dict = {}
    for idx, first_champ in enumerate(tqdm(champion_file_lst)):
        # a:b와 b:a가 동시에 존재하는걸 방지하기 위해 슬라이싱
        for second_champ in champion_file_lst[idx:]:
            # a:a를 방지하기 위해 앞뒤 이름이 다를 경우만 실행
            if first_champ != second_champ:
                vec_compare_dict[f'{first_champ[:-4]}:{second_champ[:-4]}'] = \
                    round(cos_sim(img2vec(get_grey_img(first_champ)), img2vec(get_grey_img(second_champ))), 3)
    return vec_compare_dict