from flask import jsonify
import os

from services.healthcheck_service import check_health


def hello_world():
    return "<p>Hello, World!</p>"