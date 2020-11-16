# -*- coding: utf-8 -*-
import json
import traceback
from common.autofile import *
from common.return_sign import *
from flask import Blueprint, request
auto_file = Blueprint('auto_file', __name__, url_prefix='/auto_file')


@auto_file.route('/existPath', methods=["POST", "GET"])
def exist_path_route():
    try:
        res = request.get_json(force=True)
        result = exist_path(path=res['path'])
        return RestResult(ERROR_SUCCESS, data=result, msg="Success").to_json()
    except:
        return RestResult(ERROR_RUN_EXCEPT, data=False, msg=traceback.format_exc()).to_json()
