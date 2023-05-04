# import my_utils as mu
# import json

# api_key_list = sum([a for a in json.loads(open('D:/7_LOL Project/lolproject-workspace/workspace_김명재/json/apiKeyList.json', 'rt', encoding='UTF8').read()).values()], [])
# print('현재 키 목록:', api_key_list)

# mu.autoInsert(api_key_list[0], './workspace_김명재/logs/auotInsertContinue.log', start_page=1, debug=False)

import time
from tqdm import tqdm

while True:
    time.sleep(10)
    if int(time.time()) % 60 <= 10: 
        for i in tqdm(range(60 - int(time.time()) % 60), total=60, initial=int(time.time()) % 60):
            time.sleep(1)
    else: print('no')