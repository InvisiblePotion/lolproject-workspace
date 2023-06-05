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
	return mu.reloadPlayRecord(summoner_name, 'RGAPI-baa753a4-a532-4640-9886-d8f05d8f2b39').__str__()

app.run()