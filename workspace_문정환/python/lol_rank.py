import pymysql
import pandas as pd
import requests
from tqdm import tqdm
import time
import random

tqdm.pandas()

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

"""
롤 상위랭크
"""

def lol_Challenger():
    result = []
    columns = ['summonerId', 'summonerName', 'leaguePoints', 'wins',
               'losses', 'veteran', 'inactive', 'freshBlood', 'hotStreak']
    riot_api_key = 'RGAPI-baa753a4-a532-4640-9886-d8f05d8f2b39'

    url_ch = f'https://kr.api.riotgames.com/lol/league/v4/challengerleagues/by-queue/RANKED_SOLO_5x5?api_key={riot_api_key}'
    res = requests.get(url_ch).json()
    df = pd.DataFrame(res)

    for i in range(len(df)):
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

            result.append(lst)
            lol_ch_df = pd.DataFrame(result, columns=columns)

        except:
            continue
    return lol_ch_df

def lol_Grandmaster():
    result = []
    columns = ['summonerId', 'summonerName', 'leaguePoints', 'wins',
               'losses', 'veteran', 'inactive', 'freshBlood', 'hotStreak']
    riot_api_key = 'RGAPI-baa753a4-a532-4640-9886-d8f05d8f2b39'

    url_ch = f'https://kr.api.riotgames.com/lol/league/v4/grandmasterleagues/by-queue/RANKED_SOLO_5x5?api_key={riot_api_key}'
    res = requests.get(url_ch).json()
    df = pd.DataFrame(res)

    for i in range(len(df)):
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

            result.append(lst)
            lol_ch_df = pd.DataFrame(result, columns=columns)

        except:
            continue
    return lol_ch_df

def lol_Master():
    result = []
    columns = ['summonerId', 'summonerName', 'leaguePoints', 'wins',
               'losses', 'veteran', 'inactive', 'freshBlood', 'hotStreak']
    riot_api_key = 'RGAPI-baa753a4-a532-4640-9886-d8f05d8f2b39'

    url_ch = f'https://kr.api.riotgames.com/lol/league/v4/masterleagues/by-queue/RANKED_SOLO_5x5?api_key={riot_api_key}'
    res = requests.get(url_ch).json()
    df = pd.DataFrame(res)

    for i in range(len(df)):
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

            result.append(lst)
            lol_ch_df = pd.DataFrame(result, columns=columns)

        except:
            continue
    return lol_ch_df

"""
상위티어 인설트
"""


def insert_lol_ch(x,conn):
    query = (
    f'insert into lol_challenger(summonerId,summonerName,leaguePoints,wins,losses,veteran,inactive,freshBlood,hotStreak)'
    f'values({repr(x.summonerId)},{repr(x.summonerName)},{x.leaguePoints},{x.wins},'
    f'{x.losses},{x.veteran},{x.inactive},{x.freshBlood},{x.hotStreak})'
    f'ON DUPLICATE KEY UPDATE '
    f'summonerId = {repr(x.summonerId)},summonerName = {repr(x.summonerName)},leaguePoints = {x.leaguePoints},wins = {x.wins}'
    f',losses = {x.losses},veteran={x.veteran},inactive = {x.inactive},freshBlood = {x.freshBlood},hotStreak = {x.hotStreak}'
    )
    mysql_execute(query,conn)
    return

def insert_lol_gm(x,conn):
    query = (
    f'insert into lol_grandmaster(summonerId,summonerName,leaguePoints,wins,losses,veteran,inactive,freshBlood,hotStreak)'
    f'values({repr(x.summonerId)},{repr(x.summonerName)},{x.leaguePoints},{x.wins},'
    f'{x.losses},{x.veteran},{x.inactive},{x.freshBlood},{x.hotStreak})'
    f'ON DUPLICATE KEY UPDATE '
    f'summonerId = {repr(x.summonerId)},summonerName = {repr(x.summonerName)},leaguePoints = {x.leaguePoints},wins = {x.wins}'
    f',losses = {x.losses},veteran={x.veteran},inactive = {x.inactive},freshBlood = {x.freshBlood},hotStreak = {x.hotStreak}'
    )
    mysql_execute(query,conn)
    return

def insert_lol_m(x,conn):
    query = (
    f'insert into lol_master(summonerId,summonerName,leaguePoints,wins,losses,veteran,inactive,freshBlood,hotStreak)'
    f'values({repr(x.summonerId)},{repr(x.summonerName)},{x.leaguePoints},{x.wins},'
    f'{x.losses},{x.veteran},{x.inactive},{x.freshBlood},{x.hotStreak})'
    f'ON DUPLICATE KEY UPDATE '
    f'summonerId = {repr(x.summonerId)},summonerName = {repr(x.summonerName)},leaguePoints = {x.leaguePoints},wins = {x.wins}'
    f',losses = {x.losses},veteran={x.veteran},inactive = {x.inactive},freshBlood = {x.freshBlood},hotStreak = {x.hotStreak}'
    )
    mysql_execute(query,conn)
    return

"""
테스트
"""
# def insert_item_ch(x,conn):
#     query=(
#         f'insert into item_table(item_id,name_er,name_kr,upper_item,buy_price,sell_price,tag)'
#         f'values({repr(x.item_id)},{repr(x.name_er)},{repr(x.name_kr)},{repr(x.upper_item)},'
#         f'{x.buy_price},{x.sell_price},{repr(x.tag)})'
#     )
#     mysql_execute(query,conn)
#     return
def insert_item_ch(x,conn):
    query=(
        f'insert into item_table_test(item_id,name_er,name_kr,buy_price,sell_price,tag)'
        f'values({x.item_id},{repr(x.name_er)},{repr(x.name_kr)},'
        f'{x.buy_price},{x.sell_price},{repr(x.tag)})'
    )
    mysql_execute(query,conn)
    return

def insert_upper_item(x,conn):
    query=(
        f'insert into upper_item(item_id,upper_item)'
        f'values({x.item_id},{x.upper_item}'
    )
    mysql_execute(query,conn)
    return

