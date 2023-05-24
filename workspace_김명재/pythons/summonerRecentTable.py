import my_utils as mu
import pandas as pd
from tqdm import tqdm


def fetchGameIdsBySummonerName(summoner_name: str) -> str:
    sql = f"""
        SELECT *
        FROM (
            SELECT GAME_ID
            FROM RAWDATA
            WHERE PARTICIPANT_NAME = '{summoner_name}'
            ORDER BY GAME_ID DESC)
        WHERE ROWNUM <= 20
    """
    game_ids = mu.oracle_totalExecute(sql, debug_print=False)['GAME_ID'].tolist()
    game_ids.sort(reverse=True)

    return game_ids

## 이거 300시간 넘게 걸려서 포기

# summoner_names = mu.oracle_totalExecute('SELECT SUMMONER_NAME FROM SUMMONER')
# for s_name in tqdm(summoner_names['SUMMONER_NAME'].tolist(), desc='SUMMONER_RECENT_GAME 테이블 갱신 중'):
#     for game_id in fetchGameIdsBySummonerName(s_name):
#         mu.oracle_totalExecute(f"INSERT INTO SUMMONER_RECENT_GAME (SUMMONER_NAME, GAME_ID) VALUES ('{s_name}', '{game_id}')", debug_print=False)