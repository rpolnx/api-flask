import os

from dotenv import load_dotenv
from flask import Flask, request
from flask_json import FlaskJSON, JsonError, as_json, json_response

from routes.blueprint import blueprint


def create_app():
    app = Flask(__name__)
    
    FlaskJSON(app)

    return app



if __name__ == '__main__':
    load_dotenv()

    app = create_app()
    app.register_blueprint(blueprint, url_prefix='/api/v1')
    
    host = os.getenv("HOST")
    port = os.getenv("PORT")
    
    env = os.getenv("FLASK_ENV")

    app.run(host, port, debug=env != "production")
