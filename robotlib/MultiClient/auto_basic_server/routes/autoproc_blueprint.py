# -*- coding: utf-8 -*-
import traceback
from flask import Blueprint, request

from common.autoproc import *
from common.return_sign import *
from common.logger import log

auto_proc = Blueprint('auto_proc', __name__, url_prefix='/auto_proc')


@auto_proc.route('/exec_cmd', methods=["POST", "GET"])
def exec_cmd_route():
    try:
        rst = request.get_json(force=True)
        result = exec_cmd(cmd=rst['cmd'], cwd=rst.get('cwd'), is_wait=rst.get('is_wait'),
                          timeout=rst.get('timeout'))
        log.info(result)
        return RestResult(ERROR_SUCCESS, data=result, msg="Success").to_json()
    except:
        return RestResult(ERROR_RUN_EXCEPT, data=False, msg=traceback.format_exc()).to_json()
