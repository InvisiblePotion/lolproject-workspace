from flask import Flask
from flask import request
from flask_cors import CORS
import my_utils as mu

app = Flask(__name__)
app.config.update(
	SERVER_NAME='localhost:8095'
)
CORS(app)

@app.route('/personlol/summoner/reload-playrecord', methods=['GET'])
def recordReload():
	summoner_name = request.args.get('summoner_name')
	print(f"recordReload() >> 전적 갱신 작동. 대상 소환사 이름: {summoner_name}")
	return mu.reloadPlayRecord(summoner_name, '문정환1').__str__()

app.run()