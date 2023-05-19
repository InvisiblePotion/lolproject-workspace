import my_utils as mu
import json

api_key_list = sum([a for a in json.loads(open('D:\\lol_project\\lolproject-workspace\\dbpc\\json\\apiKeyList.json', 'rt', encoding='UTF8').read()).values()], [])
print('현재 키 목록:', api_key_list)

api_key = api_key_list[0]
print('사용된 키:', api_key)

mu.autoInsert(riot_api_key=api_key, logging_path='D:\\lol_project\\lolproject-workspace\\dbpc\\logs\\autoInsertContinues_DBPC.log', start_page=1, debug=False)