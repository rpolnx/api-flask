import os

from dotenv import load_dotenv
from flask import Flask, request

from routes.blueprint import blueprint


def create_app():
    app = Flask(__name__)

    return app

if __name__ == '__main__':
    load_dotenv()

    app = create_app()
    app.register_blueprint(blueprint, url_prefix='/api/v1')
    
    host = os.getenv("HOST") or "0.0.0.0"
    port = os.getenv("PORT") or "8080"
    debug = os.getenv("FLASK_ENV") != "production" or False

    app.run(host, port, debug)
