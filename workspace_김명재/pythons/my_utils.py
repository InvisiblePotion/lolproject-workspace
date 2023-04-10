import cx_Oracle as ora
import pymysql as mysql
import pandas as pd
import requests
from urllib import parse
from tqdm import tqdm
import time
import random

dsn = ora.makedsn('localhost', 1521, 'xe')


db = None
cursor = None
seoul_api_key = None


def db_open(debug_print: bool=False):
    global db
    global cursor
    db = ora.connect(user='lol_data', password='1234', dsn=dsn)
    cursor = db.cursor()
    if debug_print: print('oracle open!')


def oracle_execute(query: str, debug_print: bool=False):
    global db
    global cursor
    try:
        if 'SELECT ' in query.upper():
            df = pd.read_sql(sql=query, con=db)
            return df
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


def oracle_totalExecute(query: str, debug_print: bool=True):
    db_open(debug_print)
    result = oracle_execute(query, debug_print)
    oracle_close(debug_print)
    return result


def connect_mysql(db: str):
    conn = mysql.connect(host='localhost', user='root', password='1234', db=db, charset='utf8')
    return conn


def mysql_execute(query: str, conn):
    cursor_mysql = conn.cursor()
    cursor_mysql.execute(query)
    result = cursor_mysql.fetchall()
    return result


def mysql_execute_dict(query: str, conn):
    cursor_mysql = conn.cursor(cursor=mysql.cursors.DictCursor)
    cursor_mysql.execute(query)
    result = cursor_mysql.fetchall()
    return result


def df_creator(url: str, seoul_api_key: str):
    url = url.replace('(인증키)', seoul_api_key).replace('xml', 'json').replace('/5/', '/1000/')
    res = requests.get(url).json()
    key = list(res.keys())[0]
    data = res[key]['row']
    df = pd.DataFrame(data)
    return df


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
def insertDataFrameIntoTable(data_frame: pd.DataFrame, table_name: str):
    # 테이블 명 대문자 아니면 에러남
    table_name = table_name.upper()
    
    # 데이터를 삽입 할 테이블의 컬럼에 대한 정보를 가져옴. (데이터 타입 검사 목적)
    ## 컬럼ID 기준으로 인덱스 정렬을 안하면 가끔 컬럼 순서가 꼬인다.
    print('>>> 테이블의 컬럼 정보 검색 중...')
    try:
        tab_col = oracle_totalExecute(f"SELECT * FROM ALL_TAB_COLUMNS WHERE TABLE_NAME = '{table_name}'", debug_print=False)\
            .sort_values('COLUMN_ID', ignore_index=True)
    except:
        print('>>> Exception: 테이블 컬럼 정보 검색 실패!! (추정: 테이블 명 입력 오류 또는 db 접속 실패)')
        return
    
    # MERGE를 이용한 중복 검사를 위한 기본키(조합키) 검색
    print('>>> 테이블의 Primary Key 정보 검색 중...')
    pk_col = [val for val in\
              oracle_totalExecute(f"SELECT COLUMN_NAME FROM USER_CONS_COLUMNS WHERE TABLE_NAME = '{table_name}'", debug_print=False)['COLUMN_NAME']]
    
    # 데이터 삽입 시작
    print('>>> 테이블에 데이터 삽입 중...')
    db_open(debug_print=False)
    for rec_idx in tqdm(range(len(data_frame))):
        values = ''
        dual_on_cv = ''

        # values 변수에 sql의 values()에 쓰일 모든 값을 담는다
        for col_idx in range(len(data_frame.iloc[rec_idx])):
            try:
                if tab_col['DATA_TYPE'][col_idx] == 'NUMBER': # 타입이 NUMBER거나
                    values += str(data_frame.iloc[rec_idx][col_idx])+', '
                    if data_frame.columns[col_idx].upper() in pk_col:
                        dual_on_cv += data_frame.columns[col_idx].upper() + '=' + str(data_frame.iloc[rec_idx][col_idx]) + ' and '
                elif tab_col['DATA_TYPE'][col_idx] == 'FLOAT': # FLOAT라면 ''를 붙이지 않는다. (추후 조건 추가 필요 가능성 높음)
                    values += str(data_frame.iloc[rec_idx][col_idx])+', '
                    if data_frame.columns[col_idx].upper() in pk_col:
                        dual_on_cv += data_frame.columns[col_idx].upper() + '=' + str(data_frame.iloc[rec_idx][col_idx]) + ' and '
                else:
                    values += '\''+str(data_frame.iloc[rec_idx][col_idx])+'\', '
                    if data_frame.columns[col_idx].upper() in pk_col:
                        dual_on_cv += data_frame.columns[col_idx].upper() + '=\'' + str(data_frame.iloc[rec_idx][col_idx]) + '\' and '
            except:
                print(f'''>> Warning: {rec_idx}번째 레코드의 {col_idx}번째 컬럼 값 삽입 실패. 해당 컬럼 스킵.
                    (추정: 값과 컬럼 타입 불일치. 함수 수정 필요.)''')
                values += "'INERR',"
                continue

        # 기본키가 없다면 INSERT, 있다면 MERGE를 수행
        if pk_col == []:
            # values의 마지막 ', '를 슬라이싱으로 제거
            oracle_execute(f'INSERT INTO {table_name} values({values[:-2]})', debug_print=False)
        else: 
            # dual_on_cv의 마지막 ' and '를 슬라이싱으로 제거
            oracle_execute(f'MERGE INTO {table_name} USING DUAL ON({dual_on_cv[:-5]})\
                           WHEN NOT MATCHED THEN INSERT VALUES({values[:-2]})', debug_print=False)
    oracle_close(debug_print=False)
    print('>>> 처리 완료!')


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


# LOL API의 API 접속 제한을 기다리기 위한 반복 슬립 함수
def apiSleep(slp_time: int=120):
# riot api limit 대기...(100req per 120s)
    print('sleep until request limit recovery...')
    for slp in tqdm(range(slp_time)):
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
        lst += random.sample(res,5)

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