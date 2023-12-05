from flask import Flask, request
from flask_json import FlaskJSON, JsonError, as_json, json_response

app = Flask(__name__)
FlaskJSON(app)

@app.route("/")
def hello_world():
    return "<p>Hello, World!</p>"

@app.route("/healthcheck")
def healthcheck():
    return json_response(status_=200,health="OK")
