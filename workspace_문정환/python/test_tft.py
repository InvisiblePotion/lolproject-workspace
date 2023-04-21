import pymysql
import pandas as pd
import requests
from tqdm import tqdm
import time
import random

tqdm.pandas()
riot_api_key = 'RGAPI-656e9f35-c20f-435e-85d9-510c9fe389e4'



'''
my_sql
'''
def connect_mysql(db):
    conn = pymysql.connect(host='localhost', user='root', password='1234', db=db,
                           charset='utf8')
    return conn

def mysql_execute(query, conn):
    cursor_mysql = conn.cursor()
    cursor_mysql.execute(query)
    result = cursor_mysql.fetchall()
    return result

def mysql_execute_dict(query, conn):
    cursor_mysql = conn.cursor(cursor = pymysql.cursors.DictCursor)
    cursor_mysql.execute(query)
    result = cursor_mysql.fetchall()
    return result


'''
상위 티어 정보 불러오기
'''

def tft_Challenger():
    result_lst = []
    columns = ['summonerId', 'summonerName', 'leaguePoints','wins',
               'losses', 'veteran', 'inactive', 'freshBlood', 'hotStreak']

    riot_api_key = 'RGAPI-e1e118e8-093c-46be-a627-9473526421a3'

    url = f'https://kr.api.riotgames.com/tft/league/v1/challenger?api_key={riot_api_key}'
    res = requests.get(url).json()
    df = pd.DataFrame(res)

    for i in tqdm(range(len(df))):
        try:
            lst = []
            lst.append(df.iloc[i]['entries']['summonerId'])
            lst.append(df.iloc[i]['entries']['summonerName'])
            lst.append(df.iloc[i]['entries']['leaguePoints'])
            lst.append(df.iloc[i]['entries']['wins'])
            lst.append(df.iloc[i]['entries']['losses'])
            lst.append(df.iloc[i]['entries']['veteran'])
            lst.append(df.iloc[i]['entries']['inactive'])
            lst.append(df.iloc[i]['entries']['freshBlood'])
            lst.append(df.iloc[i]['entries']['hotStreak'])

            result_lst.append(lst)
            challenger_df = pd.DataFrame(result_lst, columns=columns)
        except:
            continue
    return challenger_df


def tft_grandmaster():
    result_lst = []
    columns = ['summonerId', 'summonerName', 'leaguePoints',  'wins',
               'losses', 'veteran', 'inactive', 'freshBlood', 'hotStreak']

    riot_api_key = 'RGAPI-e1e118e8-093c-46be-a627-9473526421a3'

    url = f'https://kr.api.riotgames.com/tft/league/v1/grandmaster?api_key={riot_api_key}'
    res = requests.get(url).json()
    df = pd.DataFrame(res)

    for i in tqdm(range(len(df))):
        try:
            lst = []
            lst.append(df.iloc[i]['entries']['summonerId'])
            lst.append(df.iloc[i]['entries']['summonerName'])
            lst.append(df.iloc[i]['entries']['leaguePoints'])
            lst.append(df.iloc[i]['entries']['wins'])
            lst.append(df.iloc[i]['entries']['losses'])
            lst.append(df.iloc[i]['entries']['veteran'])
            lst.append(df.iloc[i]['entries']['inactive'])
            lst.append(df.iloc[i]['entries']['freshBlood'])
            lst.append(df.iloc[i]['entries']['hotStreak'])

            result_lst.append(lst)
            grandmaster_df = pd.DataFrame(result_lst, columns=columns)
        except:
            continue
    return grandmaster_df


def tft_master():
    result_lst = []
    columns = ['summonerId', 'summonerName', 'leaguePoints', 'wins',
               'losses', 'veteran', 'inactive', 'freshBlood', 'hotStreak']

    riot_api_key = 'RGAPI-e1e118e8-093c-46be-a627-9473526421a3'

    url = f'https://kr.api.riotgames.com/tft/league/v1/master?api_key={riot_api_key}'
    res = requests.get(url).json()
    df = pd.DataFrame(res)

    for i in tqdm(range(len(df))):
        try:
            lst = []
            lst.append(df.iloc[i]['entries']['summonerId'])
            lst.append(df.iloc[i]['entries']['summonerName'])
            lst.append(df.iloc[i]['entries']['leaguePoints'])
            lst.append(df.iloc[i]['entries']['wins'])
            lst.append(df.iloc[i]['entries']['losses'])
            lst.append(df.iloc[i]['entries']['veteran'])
            lst.append(df.iloc[i]['entries']['inactive'])
            lst.append(df.iloc[i]['entries']['freshBlood'])
            lst.append(df.iloc[i]['entries']['hotStreak'])

            result_lst.append(lst)
            master_df = pd.DataFrame(result_lst, columns=columns)
        except:
            continue
    return master_df

'''
상위티어 인설트
'''
def insert_ches_ch(x,conn):
    query=(
        f'insert into test_challenger(summonerId,summonerName,leaguePoints,wins,losses,veteran,inactive,freshBlood,hotStreak)'
        f'values({repr(x.summonerId)},{repr(x.summonerName)},{x.leaguePoints},{x.wins},'
        f'{x.losses},{x.veteran},{x.inactive},{x.freshBlood},{x.hotStreak})'
        f'ON DUPLICATE KEY UPDATE '
        f'summonerId = {repr(x.summonerId)},summonerName = {repr(x.summonerName)},leaguePoints = {x.leaguePoints},wins = {x.wins}'
        f',losses = {x.losses},veteran={x.veteran},inactive = {x.inactive},freshBlood = {x.freshBlood},hotStreak = {x.hotStreak}'
    )
    mysql_execute(query,conn)
    return

def insert_ches_gm(x,conn):
    query=(
        f'insert into test_grandmaster(summonerId,summonerName,leaguePoints,wins,losses,veteran,inactive,freshBlood,hotStreak)'
        f'values({repr(x.summonerId)},{repr(x.summonerName)},{x.leaguePoints},{x.wins},'
        f'{x.losses},{x.veteran},{x.inactive},{x.freshBlood},{x.hotStreak})'
        f'ON DUPLICATE KEY UPDATE '
        f'summonerId = {repr(x.summonerId)},summonerName = {repr(x.summonerName)},leaguePoints = {x.leaguePoints},wins = {x.wins}'
        f',losses = {x.losses},veteran={x.veteran},inactive = {x.inactive},freshBlood = {x.freshBlood},hotStreak = {x.hotStreak}'
    )
    mysql_execute(query,conn)
    return

def insert_ches_m(x,conn):
    query=(
        f'insert into test_master(summonerId,summonerName,leaguePoints,wins,losses,veteran,inactive,freshBlood,hotStreak)'
        f'values({repr(x.summonerId)},{repr(x.summonerName)},{x.leaguePoints},{x.wins},'
        f'{x.losses},{x.veteran},{x.inactive},{x.freshBlood},{x.hotStreak})'
        f'ON DUPLICATE KEY UPDATE '
        f'summonerId = {repr(x.summonerId)},summonerName = {repr(x.summonerName)},leaguePoints = {x.leaguePoints},wins = {x.wins}'
        f',losses = {x.losses},veteran={x.veteran},inactive = {x.inactive},freshBlood = {x.freshBlood},hotStreak = {x.hotStreak}'
    )
    mysql_execute(query,conn)
    return


'''
다이아티어 이하
'''

def get_puuid_ches(user):
    my_url =f'https://kr.api.riotgames.com/tft/summoner/v1/summoners/by-name/{user}?api_key={riot_api_key}'
    my_res = requests.get(my_url).json()
    my_puuid = my_res['puuid']
    return my_puuid

def get_matchId_ches(puuid,num):
    my_url2=f'https://asia.api.riotgames.com/tft/match/v1/matches/by-puuid/{puuid}/ids?type=ranked&start=0&count={num}&api_key={riot_api_key}'
    my_res_matchId = requests.get(my_url2).json()
    return my_res_matchId

def get_matches_ches(match_one):
    my_url3 = f'https://asia.api.riotgames.com/tft/match/v1/matches/{match_one}?api_key={riot_api_key}'
    my_res_match = requests.get(my_url3).json()
    return my_res_match

def get_rawdata_ches(tier): # 1번
    division_list = ['I', 'II', 'III', 'IV']
    lst = []
    page = random.randrange(1, 5)
    print('get_SummonerName....from', page,'page')
    for division in tqdm(division_list):
        url = f'https://kr.api.riotgames.com/tft/league/v1/entries/{tier}/{division}?page={page}&api_key={riot_api_key}'
        res = requests.get(url).json()
        lst += random.sample(res, 5)
    summonerName_lst = list(map(lambda x: x['summonerName'], lst))

    print('get puuid.....')
    puuid_lst = []
    for i in tqdm(summonerName_lst):
        try:
            puuid_lst.append(get_puuid_ches(i))
        except:
            print(i)
            continue

    print('get_match_id........')
    match_id_lst = []
    for j in tqdm(puuid_lst):
        match_id_lst += get_matchId_ches(j, 2)

    print('get matches & timeline ......')
    df_create = []
    for match_id in tqdm(match_id_lst):
        matches = get_matches_ches(match_id)
        time.sleep(2)
        df_create.append([match_id, matches])

    df = pd.DataFrame(df_create, columns=['match_id', 'matches'])
    print('complete')

    return df


def insert_upper_items(x,conn):
    query = (
        f"INSERT INTO upper_items (item_id, upper_item) "
        f"VALUES ({x.item_id}, {x.upper_item})"
    )
    mysql_execute(query,conn)
    return
