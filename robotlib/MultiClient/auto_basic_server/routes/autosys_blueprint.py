#!/usr/bin/python3
# -*- coding: utf-8 -*-
# @File : autosys_blueprint.py
# @Author: lipengb@uniontech.com

import traceback
from common.autosys import *
from common.return_sign import *
from flask import Blueprint, request, make_response, send_file
from common.logger import log

auto_sys = Blueprint('auto_sys', __name__, url_prefix='/auto_sys')


@auto_sys.route('/getHostName', methods=["POST", "GET"])
def get_host_name_route():
    try:
        result = get_host_name()
        return RestResult(ERROR_SUCCESS, data=result, msg="Success").to_json()
    except Exception:
        log.error(traceback.format_exc())
        return RestResult(ERROR_RUN_EXCEPT, data=False, msg=traceback.format_exc()).to_json()


@auto_sys.route('/get_system_type', methods=["POST", "GET"])
def get_system_type_route():
    try:
        result = get_system_type()
        return RestResult(ERROR_SUCCESS, data=result, msg="Success").to_json()
    except Exception:
        log.error(traceback.format_exc())
        return RestResult(ERROR_RUN_EXCEPT, data=False, msg=traceback.format_exc()).to_json()