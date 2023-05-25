from flask import Flask
from flask_cors import CORS
import my_utils as mu

app = Flask(__name__)
app.config.update(
	SERVER_NAME='localhost:8098'
)
CORS(app)

@app.route('/record-reload/<summoner_name>', methods=['POST'])
def recordReload(summoner_name: str):
	mu.reloadPlayRecord(summoner_name, api_key)
	return "index"