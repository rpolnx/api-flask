from flask import jsonify

from services.healthcheck_service import check_health


def get_health_check():
    data = check_health()
    
    return jsonify(data), 200