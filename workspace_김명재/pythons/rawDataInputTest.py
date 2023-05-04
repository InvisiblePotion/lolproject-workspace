import my_utils as mu
import json

api_key_list = sum([a for a in json.loads(open('D:/7_LOL Project/lolproject-workspace/workspace_김명재/json/apiKeyList.json', 'rt', encoding='UTF8').read()).values()], [])
print('현재 키 목록:', api_key_list)

mu.autoInsert(api_key_list[0], './workspace_김명재/logs/test.log', start_page=1, debug=False)