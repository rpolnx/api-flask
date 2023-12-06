from flask import Blueprint

from controllers.healthcheck_controller import get_health_check
from controllers.hello_controller import hello_world

blueprint = Blueprint('blueprint', __name__)

blueprint.route('', methods=['GET'])(hello_world)
blueprint.route('/healthcheck', methods=['GET'])(get_health_check)
