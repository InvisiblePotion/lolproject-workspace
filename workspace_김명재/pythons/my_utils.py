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
import logging


class BadApiResult(Exception):
    def __init__(self, request_result: requests.Response):
        super().__init__(f"사용한 API로부터 비정상적인 리턴을 받았습니다.\
                         \n상태 코드: {request_result.status_code}\
                         \n사용된 URL: {request_result.url}")


class InvaildApiKey(Exception):
    def __init__(self, request_result: requests.Response):
        super().__init__(f"사용된 API Key가 유효하지 않습니다.\
                         \n사용된 API Key: {request_result.url[request_result.url.find('api_key') + 8:]}")
        

class WrongParticipantNumber(Exception):
    def __init__(self) -> None:
        super().__init__("participant_number는 1~10 사이의 값으로 입력해주세요.")


warnings.filterwarnings('ignore')

dsn = ora.makedsn('112.218.158.250', 4100, 'xe')
# dsn = ora.makedsn('localhost', 1521, 'xe')

db = None
cursor = None
seoul_api_key = None


def db_open(debug_print: bool=False):
    global db
    global cursor
    db = ora.connect(user='PERSONLOL', password='1234', dsn=dsn)
    # db = ora.connect(user='LOL_DATA', password='1234', dsn=dsn)
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
    return preventApiRateLimit(f"https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/{summoner_name}?api_key=", api_key).json()['puuid']


def getMatchIdsByPuuid(puuid: str, api_key: str, count: int=10):
    return preventApiRateLimit(f"https://asia.api.riotgames.com/lol/match/v5/matches/by-puuid/{puuid}/ids?start=0&count={count}&type=ranked&api_key=", api_key).json()


def getMatchDataByMatchIds(match_ids: list, api_key: str, index: int=0):
    return preventApiRateLimit(f"https://asia.api.riotgames.com/lol/match/v5/matches/{match_ids[index]}?api_key=", api_key).json()


def getMatchTimelineDataByMatchIds(match_ids: list, api_key: str, index: int=0):
    return preventApiRateLimit(f"https://asia.api.riotgames.com/lol/match/v5/matches/{match_ids[index]}/timeline?api_key=", api_key).json()


def getMatchDataAndTimelineByMatchId(match_id: str, api_key: str):
    match_data = preventApiRateLimit(f"https://asia.api.riotgames.com/lol/match/v5/matches/{match_id}?api_key=", api_key).json()
    match_timeline = preventApiRateLimit(f"https://asia.api.riotgames.com/lol/match/v5/matches/{match_id}/timeline?api_key=", api_key).json()
    return match_data, match_timeline


def getMatchDataByName(summoner_name: str, api_key: str, get_count: int=10, match_index: int=0):
    puuid = getPuuidBySummonerName(summoner_name, api_key)
    match_ids = getMatchIdsByPuuid(puuid, api_key, get_count)
    match_data = getMatchDataByMatchIds(match_ids, api_key, match_index)
    match_timeline = getMatchTimelineDataByMatchIds(match_ids, api_key, match_index)
    return {'match_data': match_data, 'match_timeline': match_timeline}


# 가공된 DTO 형태의 데이터프레임을 데이터베이스 테이블에 삽입해주는 함수
def insertDataFrameIntoTable(data_frame: pd.DataFrame, table_name: str, debug_print: bool=True, print_sql: bool=False):
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
    
    # 테이블의 UQ 정보를 조회하는 쿼리
    uq_col_execute = f"""
        SELECT COLUMN_NAME
        FROM USER_CONS_COLUMNS
        WHERE CONSTRAINT_NAME = (SELECT CONSTRAINT_NAME
                                 FROM ALL_CONSTRAINTS
                                 WHERE TABLE_NAME = '{table_name}'
                                 AND CONSTRAINT_TYPE = 'U')"""
    uq_col = [val for val in \
              oracle_totalExecute(uq_col_execute, debug_print=False)['COLUMN_NAME']]
    
    pk_col += uq_col
    
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
                elif tab_col['DATA_TYPE'][col_idx] == 'DATE':
                    values.append('TO_DATE(\''+str(data_frame.iloc[rec_idx][col_idx])+'\', \'YYYY-MM-DD HH24:MI:SS\')')
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
        if print_sql: print(execute)
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
        url = f'https://kr.api.riotgames.com/lol/league/v4/entries/RANKED_SOLO_5x5/{tier}/{division}?page={page}&api_key='
        res = preventApiRateLimit(url, riot_api_key).json()
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
        url = f'https://kr.api.riotgames.com/lol/league/v4/entries/RANKED_SOLO_5x5/{tier}/{division_list[division-1]}?page={page}&api_key='
        res = preventApiRateLimit(url, riot_api_key).json()
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


# 원하는 시간까지의 플레이어가 소지중인 아이템을 추적하여 리스트로 반환하는 함수
def getHoldingItems(raw_data_series: pd.Series, part_number: int, end_time: int=-1):

	# end_time이 -1이거나 게임 종료 시간을 초과한 값이라면 end_time에 게임 종료 시간을 저장
	game_end_time = eventExtractor(raw_data_series, 'GAME_END')[0]['timestamp']
	if (end_time == -1) or (end_time > game_end_time): end_time = game_end_time

	# 아이템 구매, 판매, 되돌리기 이벤트를 종합
	item_events = \
		[{'timestamp':purchased['timestamp'], 'type':purchased['type'], 'itemId':purchased['itemId']}\
		for purchased in list(filter(lambda x: x['timestamp'] <= end_time, eventExtractor(raw_data_series, 'ITEM_PURCHASED', part_number)))] + \
		[{'timestamp':sold['timestamp'], 'type':sold['type'], 'itemId':sold['itemId']}\
		for sold in list(filter(lambda x: x['timestamp'] <= end_time, eventExtractor(raw_data_series, 'ITEM_SOLD', part_number)))] + \
		[{'timestamp':undo['timestamp'], 'type':undo['type'], 'beforeId':undo['beforeId'], 'afterId':undo['afterId']}\
		for undo in list(filter(lambda x: x['timestamp'] <= end_time, eventExtractor(raw_data_series, 'ITEM_UNDO', part_number)))] + \
		[{'timestamp':destroyed['timestamp'], 'type':destroyed['type'], 'itemId':destroyed['itemId']}\
		for destroyed in list(filter(lambda x: x['timestamp'] <= end_time, eventExtractor(raw_data_series, 'ITEM_DESTROYED', part_number)))]

	# timestamp로 이벤트를 시간 순 정렬
	item_events.sort(key=lambda x: x['timestamp'])

	# 되돌리기 이벤트와 되돌려진 이벤트 제거
	evt_list = []
	for evt in item_events:
		try:
			if evt['type'] == 'ITEM_UNDO': evt_list.pop() # UNDO 이벤트 발생시 최근 이벤트 제거
			else: evt_list.append(evt)

		except IndexError as e: # UNDO가 가장 먼저 나오거나 구매 및 판매 횟수보다 많은 케이스에 대한 예외 처리 및 로깅
			logging.warning({"time": time.strftime('%Y-%m-%d %H:%M:%S'), "errorType": "getHoldingItems.unexpectedItemUndo",
				"dataType": "dict", "data": {"participantId": part_number, "matchId": raw_data_series['matches']['metadata']['matchId']}})
			continue
		except Exception as e:  # 예측하지 못한 예외 발생 시 로깅 후 에러를 발생
			logging.error({"time": time.strftime('%Y-%m-%d %H:%M:%S'), "errorType": "getHoldingItems.unexpectedItemUndo",
		  		"dataType": "matchId", "data": raw_data_series['matches']['metadata']['matchId']})
			raise e

	# 정제된 이벤트 리스트로 현재 아이템을 추적하여 리턴
	start_items = []
	for evt in evt_list:
		try:
			if evt['type'] == 'ITEM_PURCHASED': start_items.append(evt['itemId'])
			else: start_items.remove(evt['itemId'])

        ### 230510: 현재 장신구에 대한 파괴가 이 에러로 빠지는 이슈가 있음.
        ##: 전령의 눈과 같은 장신구 칸을 차지하는 아이템이 원인인 것으로 추정 중. (정글러 챔피언이 다수임)
		except ValueError as e: # 구매하지 않은 아이템이 판매되는 경우에 대한 예외 처리 및 로깅
			logging.info({"time": time.strftime('%Y-%m-%d %H:%M:%S'), "errorType": "getHoldingItems.unexpectedItemSoldOrDestroy",
		  		"dataType": "dict", "data": {"itemId": evt['itemId'], "championName": raw_data_series['matches']['info']['participants'][part_number-1]['championName'],
                                             "participantId": part_number, "matchId": raw_data_series['matches']['metadata']['matchId']}})
			continue
		except Exception as e: # 예측하지 못한 예외 발생 시 로깅 후 에러를 발생
			logging.error({"time": time.strftime('%Y-%m-%d %H:%M:%S'), "errorType": "getHoldingItems.exception",
		  		"dataType": "matchId", "data": raw_data_series['matches']['metadata']['matchId']})
			raise e
			
	return start_items


def RawdataFirstFilter(rawdata: pd.DataFrame, api_key: str):
    """
    RawData를 1차 정제 형태로 변환해주는 함수
    """

    # 전설, 신화 아이템 리스트: 13.10.1 (버전별 갱신 필요)
    legend_items = [
        3003,3004,3011,3026,3033,3036,3040,3041,3042,3046,
        3050,3053,3065,3068,3071,3072,3074,3075,3083,3085,
        3087,3089,3091,3094,3095,3100,3102,3107,3109,3110,
        3115,3116,3119,3121,3135,3139,3143,3153,3156,3157,
        3161,3165,3179,3181,3193,3222,3504,3508,3742,3748,
        3814,4005,4401,4628,4629,4637,4643,4645,6035,6333,
        6609,6616,6664,6672,6673,6676,6693,6694,6695,6696,
        8001,8020]
    
    mythic_items = [
        2065,3001,3031,3078,3084,3124,3142,3152,3190,4633,
        4636,4644,6617,6620,6630,6631,6632,6653,6655,6656,
        6657,6662,6665,6667,6671,6675,6691,6692]
    

    result = []
    try:
        for game in rawdata.iloc:
            for part_num in range(10):
                matches = game['matches']['info']
                part = matches['participants'][part_num]
                challenge = part['challenges']


                # 예외 처리부

                # 팀에서 킬이 나지 않은 경우 killParticipation키가 없는 경우가 발생해 해당 경우엔 대신 0으로 넣는다.
                try: kill_participation = challenge['killParticipation']
                except KeyError:kill_participation = 0

                # 팀이 가한 피해량이 없는 경우 teamDamagePercentage 키가 없는 경우가 발생해 해당 경우엔 대신 0으로 넣는다.
                try: team_damage_percentage = challenge['teamDamagePercentage']
                except KeyError: team_damage_percentage = 0

                # 게임이 유저의 라인을 추측하지 못할 정도로 비정상적으로 빠르게 끝났다면 (ex. 다시하기)
                #:라인 관련 데이터가 없거나 비정상적인 정보가 들어간 경우 대신 'NONE'을 넣는다.
                lane_list = ['TOP','JUNGLE','MIDDLE','BOTTOM']
                position_list = ['TOP','JUNGLE','MIDDLE','BOTTOM','UTILITY']

                if (lane := part['lane']) not in lane_list: lane = 'NONE'
                if (individual_position := part['individualPosition']) not in position_list: individual_position = 'NONE'
                if (team_position := part['teamPosition']) not in position_list: team_position = 'NONE'

                win = 1 if part['win'] else 0
                first_blood_kill = 1 if part['firstBloodKill'] else 0


                each_part = {
                    'version': matches['gameVersion'],
                    'game_create_time': matches['gameCreation'],
                    'game_duration': matches['gameDuration'],
                    'game_id': game['matches']['metadata']['matchId'],
                    'participant_number': part['participantId'],
                    'participant_name': part['summonerName'],
                    'champion_id': part['championId'],
                    'lane': part['teamPosition'],
                    'participant_puuid': part['puuid'],
                    'api_key': api_key,
                    'game': str({
                        'gameCreation': matches['gameCreation'],
                        'gameStartTimestamp': matches['gameStartTimestamp'],
                        'gameEndTimestamp': matches['gameEndTimestamp'],
                        'gameDuration': matches['gameDuration'],
                        'gameVersion': matches['gameVersion'],
                        'queueId': matches['queueId'],
                        'bans': matches['teams'][0]['bans'] + matches['teams'][1]['bans']
                    }).replace("'",'"'),
                    'summoner': str({
                        'summonerName': part['summonerName'],
                        'summonerLevel': part['summonerLevel'],
                        'summonerId': part['summonerId'],
                        'puuid': part['puuid']
                    }).replace("'",'"'),
                    'champion': str({
                        'championId': part['championId'],
                        'championName': part['championName'],
                        'champLevel': part['champLevel'],
                        'lane': lane, # 예외처리
                        'individualPosition': individual_position, # 예외처리
                        'teamPosition': team_position, # 예외처리
                        'teamId': part['teamId'],
                        'win': win # bool
                    }).replace("'",'"'),
                    'spell': str({
                        'summoner1Id': part['summoner1Id'],
                        'summoner2Id': part['summoner2Id']
                    }).replace("'",'"'),
                    'skill': str({
                        'spell1Casts': part['spell1Casts'],
                        'spell2Casts': part['spell2Casts'],
                        'spell3Casts': part['spell3Casts'],
                        'spell4Casts': part['spell4Casts']
                    }).replace("'",'"'),
                    'skillTree': [sk['skillSlot'] for sk in eventExtractor(game, 'SKILL_LEVEL_UP', part_num+1)],
                    'rune': str({
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
                    }).replace("'",'"'),
                    'item': str({
                        'item0': part['item0'],
                        'item1': part['item1'],
                        'item2': part['item2'],
                        'item3': part['item3'],
                        'item4': part['item4'],
                        'item5': part['item5'],
                        'item6': part['item6']
                    }).replace("'",'"'),
                    'startItem': getHoldingItems(game, part_num+1, 60000),
                    'itemTree': list(filter(lambda x: x in legend_items + mythic_items,
                        [a['itemId'] for a in eventExtractor(game, 'ITEM_PURCHASED', part_num+1)]))[:3],
                    'kda': str({
                        'kills': part['kills'],
                        'deaths': part['deaths'],
                        'assists': part['assists'],
                        'kda': challenge['kda'],
                        'killParticipation': kill_participation, # 예외처리
                        'firstBloodKill': first_blood_kill, # bool
                        'largestKillingSpree': part['largestKillingSpree'],
                        'largestMultiKill': part['largestMultiKill']
                    }).replace("'",'"'),
                    'gold': str({
                        'bountyLevel': part['bountyLevel'],
                        'bountyGold': challenge['bountyGold'],
                        'goldEarned': part['goldEarned'],
                        'goldPerMinute': challenge['goldPerMinute']
                    }).replace("'",'"'),
                    'cs': str({
                        'totalMinionsKilled': part['totalMinionsKilled'],
                        'laneMinionsFirst10Minutes': challenge['laneMinionsFirst10Minutes']
                    }).replace("'",'"'),
                    'turret': str({
                        'turretTakedowns': challenge['turretTakedowns'],
                        'turretPlatesTaken': challenge['turretPlatesTaken']
                    }).replace("'",'"'),
                    'damage': str({
                        'teamDamagePercentage': team_damage_percentage, # 예외처리
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
                    }).replace("'",'"'),
                    'vision': str({
                        'visionScore': part['visionScore'],
                        'wardsPlaced': part['wardsPlaced'],
                        'controlWardsPlaced': challenge['controlWardsPlaced'],
                        'wardsKilled': part['wardsKilled']
                    }).replace("'",'"')
                }
                result.append(each_part)
    except Exception as e:
        return e
    return result


def autoInsert(riot_api_key: str, logging_path: str, start_page: int=1, debug: bool=False, use_tqdm: bool=False, thread_no: int=1):
    """
    하나의 API Key로 DB에 1차 정제 데이터를 지속 삽입하는 함수
    """

    # 로깅
    logging.basicConfig(filename=logging_path, encoding='utf-8', level=logging.INFO)

    # 사이클 순환 정보를 위한 변수
    cycle_count = 1 # 사이클 회전 수
    inserted_player = 0 # 삽입된 Summoner 수
    inserted_game = 0 # 삽입된 RawData 수

    # API 연결 상태 디버깅용 변수
    api_nonlimit_request_count = 0 # RIOT API의 정상 리턴이나 리미트 초과가 아닌 비정상 리턴의 횟수
    api_sleep_count = 0 # 리미트 초과로 발생 횟수
    api_error_count = 0 # API의 비정상 리턴 횟수


    def safeTimeSleeper():
        """
        매 정각마다 호출되어 안전한 종료를 위해 최대 2분간 휴식하는 함수
        """
        cur_time = int(time.time()) % 3600
        for safe_time in tqdm(range(120 - cur_time), total=120, initial=cur_time, desc=f"{thread_no}번 스레드 안전 종료 대기"):
            time.sleep(1)


    def checkApiResult(url: str):
        """
        `requests.get()`의 결과에 따라서 API Key를 교체하거나 에러 메시지를 출력하고
        에러인 경우 `False`를 리턴하여 `if`가 걸린 부분의 `continue` 트리거를 작동시키는 `autoInsert()` 전용 내부 함수
        """
        nonlocal api_nonlimit_request_count
        nonlocal api_sleep_count
        nonlocal api_error_count
        is_sleep = False
        
        while True:
            try:
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
                    
            except requests.exceptions.ConnectionError as e:
                time.sleep(5)

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
        'api_key',
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
            
            # else: 
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
            if not use_tqdm: print(f"{tier} {rank}의 {page}번 페이지 가져오는 중......")
            if (summoner_page := checkApiResult(f"https://kr.api.riotgames.com/lol/league/v4/entries/RANKED_SOLO_5x5/{tier}/{rank}?page={page}&api_key=")) is False:
                logging.error({"time": time.strftime('%Y-%m-%d %H:%M:%S'), "errorType": 'rankPage', "apiKey": riot_api_key, "dataType": "str", "data": f"{tier} {rank}: {page}page"})
                continue

            # 가져온 페이지의 유저 수가 10명 미만이라면 현재 랭크 티어의 모든 페이지를 탐색 한것으로 간주하고 현재 랭크 티어의 page를 1로 초기화
            if not use_tqdm:
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
            if not use_tqdm: print(f"페이지의 유저 데이터 추출 및 삽입......")
            for summoner_id_idx, summoner_id in enumerate(summoner_id_list):

                # 안전 정지
                # if (int(time.time()) % 3600) <= 120: safeTimeSleeper()

                # 소환사 상세 정보 획득
                # (summonerId로 조회하는 데이터는 가끔 []를 반환하는 경우가 있는데, 해당 유저가 블랙리스트 처리 된 것으로 추정된다.)
                # (따라서 이러한 유저는 이 구간에서는 continue로 스킵하며 게임 데이터 내부에서 발견된 경우에만 존재하는 데이터만으로 삽입한다.)
                if (summoner_detail := checkApiResult(f"https://kr.api.riotgames.com/lol/summoner/v4/summoners/{summoner_id}?api_key=")) is False:
                    logging.error({"time": time.strftime('%Y-%m-%d %H:%M:%S'), "errorType": "apiSummonerData", "apiKey": riot_api_key, "dataType": "summonerId", "data": summoner_id})
                    continue
                if summoner_detail == []:
                    logging.error({"time": time.strftime('%Y-%m-%d %H:%M:%S'), "errorType": "summonerBlackListed", "apiKey": riot_api_key, "dataType": "summonerId", "data": summoner_id})
                    continue
                
                # Summoner 테이블에 필요한 일반 데이터 추출
                summoner_normal_data = [summoner_detail[i] for i in normal_data_keys]
                summoner_normal_data.insert(2, riot_api_key)
                
                # 소환사 정보로 Summoner 테이블 갱신
                if not debug: insertDataFrameIntoTable(pd.DataFrame([summoner_normal_data + summoner_rank_data_list[summoner_id_idx]], columns=summoner_table_cols), 'SUMMONER', debug_print=False)
                inserted_player += 1

                # 현재 puuId로부터 가장 최근의 20게임의 matchId를 획득
                if (match_id_list := checkApiResult(f"https://asia.api.riotgames.com/lol/match/v5/matches/by-puuid/{summoner_normal_data[1]}/ids?start=0&count=20&type=ranked&api_key=")) is False:
                    logging.error({"time": time.strftime('%Y-%m-%d %H:%M:%S'), "errorType": "apiMatchId", "apiKey": riot_api_key, "dataType": "puuId", "data": summoner_normal_data[1]})
                    continue
                if not use_tqdm: print(f"\t'{summoner_normal_data[3]}': 유저의 게임 정보 추출 및 삽입......")
                for match_id in match_id_list:

                    # 안전 정지
                    # if (int(time.time()) % 3600) <= 120: safeTimeSleeper()

                    # RawData 테이블에 현재 match_id가 이미 존재한다면 (# 리스트에서 제거 후) continue
                    if 0 != oracle_totalExecute(f"SELECT COUNT(game_id) FROM RAWDATA WHERE game_id = '{match_id}'", use_pandas=False, debug_print=False)[0][0]:
                        # match_id_list.remove(match_id)
                        continue
                    
                    # 현재 matchId의 matches와 timeline을 획득
                    match_raw = {
                        'matches': checkApiResult(f"https://asia.api.riotgames.com/lol/match/v5/matches/{match_id}?api_key="),
                        'timeline': checkApiResult(f"https://asia.api.riotgames.com/lol/match/v5/matches/{match_id}/timeline?api_key=")}
                    if True in [v is False for v in match_raw.values()]:
                        logging.error({"time": time.strftime('%Y-%m-%d %H:%M:%S'), "errorType": "apiMatchData", "apiKey": riot_api_key, "dataType": "matchId", "data": match_id})
                        continue

                    # RawData 테이블 형태로 가공하여 저장
                    filterd_match_raw = RawdataFirstFilter(pd.DataFrame([match_raw]), riot_api_key)

                    # 가공된 데이터가 비정상일 경우 continue
                    if filterd_match_raw.__class__ is not list:
                        logging.error({"time": time.strftime('%Y-%m-%d %H:%M:%S'), "errorType": "missingGameData", "apiKey": riot_api_key, "dataType": "dict",
                                       "data": {"error": str(f"{filterd_match_raw.__class__.__name__}: {filterd_match_raw}"), "matchId": match_id}})
                        continue

                    # 현재 게임에 참가중인 모든 플레이어의 puuid 추출후 중복을 방지하기 위해 현재 유저만 제거
                    match_puuid_list = match_raw['matches']['metadata']['participants']
                    match_puuid_list.remove(summoner_normal_data[1])

                    # 현재 게임의 소환사 데이터 저장용 리스트
                    match_part_summoner_data_list = []

                    # 현재 게임에서 9명의 puuid로 Summoner 테이블에 필요한 정보를 추출 및 삽입
                    print(f"\t\t'{match_id}': 게임 참여자의 유저 정보 추출 및 삽입......")
                    for part_puuid in match_puuid_list:

                        # puuid로 소환사 정보 획득
                        if (part_summoner_detail := checkApiResult(f"https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-puuid/{part_puuid}?api_key=")) is False:
                            logging.error({"time": time.strftime('%Y-%m-%d %H:%M:%S'), "errorType": "apiSummonerData", "apiKey": riot_api_key, "dataType": "puuId", "data": part_puuid})
                            continue
                        part_summoner_normal_data = [part_summoner_detail[i] for i in normal_data_keys]
                        part_summoner_normal_data.insert(2, riot_api_key)
                        
                        # summonerId로 랭크 관련 정보 획득
                        if (part_rank_detail := checkApiResult(f"https://kr.api.riotgames.com/lol/league/v4/entries/by-summoner/{part_summoner_normal_data[0]}?api_key=")) is False:
                            logging.error({"time": time.strftime('%Y-%m-%d %H:%M:%S'), "errorType": "apiSummonerRankData", "apiKey": riot_api_key, "dataType": "summonerId", "data": part_summoner_normal_data[0]})
                            continue
                       
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


def preventApiRateLimit(url: str, api_key: str):
        """
        `requests.get(url + api_key)`의 결과의 상태 코드가 429(API RATE EXCEED)인 경우 제한 해제까지 자동 휴식하는 함수
        """
        
        while True:
            try:
                result = requests.get(url+api_key)

                # 리퀘스트의 리스폰스가 정상인 경우 리턴
                if result.status_code == 200:
                    return result
                
                # 리미트 초과인 경우 10초 휴식 후 재시도
                elif result.status_code == 429:
                    apiSleep(10, False)
                    continue

                # 만료 되었거나 불량인 API key 사용시 API key 관련 에러문 출력
                elif result.status_code == 403:
                    raise InvaildApiKey(result)
                
                # 리턴의 상태 코드가 200, 429, 403이 아닌 경우 예외로 간주하고 API 관련 에러문 출력 출력
                else:
                    raise BadApiResult(result)
                    
            except requests.exceptions.ConnectionError as e:
                time.sleep(5)

            # 위에서 발생된 모든 예외를 캐치하여 API 관련 에러 카운트를 1 올리고 False를 리턴(continue 트리거 작동)
            except Exception as e:
                print(f"{type(e).__name__}:\n{e}")
                return False


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


# 하나의 rawdata 레코드에서 원하는 참가자의 특정 이벤트를 추출하는 함수 *(참가자는 1~10번이며 0번 입력시 전체 참가자 대상)
def eventExtractor(raw_data_series: pd.Series, event_type: str, part_number: int=0):
    if part_number in range(1, 11):
        return list(filter(lambda evt: ((evt['type']==event_type) and evt['participantId']==part_number),\
            sum([fr['events'] for fr in [ti for ti in raw_data_series['timeline']['info']['frames']]], [])))
    elif part_number == 0:
        return list(filter(lambda evt: ((evt['type']==event_type)),\
            sum([fr['events'] for fr in [ti for ti in raw_data_series['timeline']['info']['frames']]], [])))
    else: raise WrongParticipantNumber


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


# RawData 테이블에서 삽입된 플레이어 수가 10명이 아닌 게임 데이터의 game_id를 리스트로 반환하는 함수
def invalidMatchFinder():
    rawdata = oracle_totalExecute('SELECT * FROM RAWDATA', debug_print=False)
    rawdata['COUNT'] = rawdata.apply(lambda x: 1, axis=1)
    sum_of_rec = rawdata[['GAME_ID','COUNT']].groupby('GAME_ID').sum()
    return [a for a in sum_of_rec[sum_of_rec['COUNT']<10].index]


# RawData 테이블에서 플레이어 수가 비정상적인 게임 데이터를 삭제하여 무결성을 지키는 함수
def rawdataIntegrityKeeper(print_msg: bool=True):
    if (invalid_match_ids:=invalidMatchFinder()) != []:
        if print_msg:
            print('RawData 테이블의 결성 확인. 삭제를 진행합니다.')
            print(f"대상 game_id: {invalid_match_ids}")
            invalid_match_ids = tqdm(invalid_match_ids, desc='부적절한 매치 데이터 삭제 중...')
        for match_id in invalid_match_ids:
            oracle_totalExecute(f"DELETE FROM RAWDATA WHERE GAME_ID = '{match_id}'", debug_print=False)
    elif print_msg: print('RawData 테이블 무결성 상태 확인!')


def updateSummonerData(summoner_name: str, api_key: str) -> None:
    """
    ### 예외 처리 필요!
    소환사 이름으로 Summoner 테이블의 데이터를 갱신하는 함수
    """

    # Summoner 테이블 컬럼 정보
    summoner_cols = [
        'summoner_id','summoner_puuid','api_key','summoner_name','summoner_level','summoner_profile',
        'summoner_tier','summoner_wins','summoner_losses','summoner_veteran','summoner_inactive','summoner_freshblood','summoner_hotstreak']

    # API에서 소환사 정보 획득
    response_summoner = preventApiRateLimit(f"https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/{summoner_name}?api_key=", api_key).json()

    # Summoner 테이블에 필요한 소환사 데이터를 추출
    summoner_data = [
        response_summoner['id'],
        response_summoner['puuid'],
        api_key,
        summoner_name,
        response_summoner['summonerLevel'],
        response_summoner['profileIconId']]

    # API에서 소환사 랭크 정보 획득
    response_rank = preventApiRateLimit(f"https://kr.api.riotgames.com/lol/league/v4/entries/by-summoner/{summoner_data[0]}?api_key=", api_key).json()

    # Summoner 테이블에 필요한 소환사 랭크 데이터를 추출
    rank_data = None
    for rank in response_rank:
        if rank['queueType'] != 'RANKED_SOLO_5x5': continue
        rank_data = [
            rank['tier'],
            rank['wins'],
            rank['losses'],
            rank['veteran'].__int__(),
            rank['inactive'].__int__(),
            rank['freshBlood'].__int__(),
            rank['hotStreak'].__int__()]
    # 해당 소환사가 솔랭 관련 랭크 데이터가 없다면 DEFALUT로 저장
    if rank_data is None: rank_data = ['DEFAULT' for col in summoner_cols[6:]]

    # Summoner 테이블에 입력
    summoner_result = summoner_data + rank_data

    insertDataFrameIntoTable(pd.DataFrame([summoner_result], columns=summoner_cols), 'SUMMONER', debug_print=False)


def reloadPlayRecord(summoner_name: str, api_key: str, get_amount: int=20) -> None:
    """
    ### 예외 처리 필요!
    전적 갱신 버튼에 대응할 함수.\n
    해당 소환사의 최근 20게임에 대한 데이터를 불러온다.\n
    (단, 성능상의 문제로 이 함수로 불러온 게임의 다른 소환사는 Summoner 테이블의 입력되지 않으니 주의)
    """

    # 소환사 이름으로 Summoner 테이블 갱신
    updateSummonerData(summoner_name, api_key)

    # API에서 소환사의 최근 20게임의 game_id 획득
    match_ids = getMatchIdsByPuuid(getPuuidBySummonerName(summoner_name, api_key), api_key, get_amount)

    # 20게임의 게임 정보를 DB에 입력
    insert_count = len(match_ids)
    for mid in tqdm(match_ids, desc=f"'{summoner_name}': 전적 갱신 중"):

        # RawData 테이블에 이미 해당 game_id가 있다면 continue
        if oracle_totalExecute(f"SELECT * FROM RAWDATA WHERE GAME_ID = '{mid}'", debug_print=False)['VERSION'].tolist() != []:
            insert_count -= 1
            continue

        # API로 매치 데이터 불러오기
        matches, timeline = getMatchDataAndTimelineByMatchId(mid, api_key)

        # RawData 테이블에 맞춰 매치 데이터 필터링
        filtered_rawdata = RawdataFirstFilter(pd.DataFrame({'matches': [matches], 'timeline': [timeline]}), api_key)

        # RawData 테이블에 입력
        db_open()
        for data in filtered_rawdata:
            val = [a for a in data.values()]
            sql = f"""
            INSERT INTO RAWDATA VALUES(
                '{val[0]}',{val[1]},{val[2]},'{val[3]}',{val[4]},'{val[5]}',{val[6]},'{val[7]}','{val[8]}',
                '{val[9]}','{val[10]}','{val[11]}','{val[12]}','{val[13]}','{val[14]}','{val[15]}','{val[16]}',
                '{val[17]}','{val[18]}','{val[19]}','{val[20]}','{val[21]}','{val[22]}','{val[23]}','{val[24]}','{val[25]}')
            """
            oracle_execute(sql, debug_print=False)
        oracle_close()

        # summoner_recent_game 테이블에 입력
        oracle_totalExecute(f"INSERT INTO SUMMONER_RECENT_GAME VALUES ('{summoner_name}', '{mid}')", debug_print=False)
    
    time.sleep(1)
    print(f"입력된 게임 수: {insert_count}")