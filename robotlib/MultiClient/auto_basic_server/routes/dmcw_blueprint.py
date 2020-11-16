# -*- coding: utf-8 -*-
import json
import traceback
from common.dmcw import *
from common.return_sign import *
from flask import Blueprint, request

dmcw = Blueprint('dmcw', __name__, url_prefix='/dmcw')


@dmcw.route('/numAdd', methods=["POST", "GET"])
def set_numadd_route():
    try:
        res = request.get_json(force=True)
        result = numadd(num1=res["numa"], num2=res["numb"])
        return RestResult(ERROR_SUCCESS, data=result, msg='Sucess').to_json()
    except:
        return RestResult(ERROR_RUN_EXCEPT, data=False, msg=traceback.format_exc()).to_json()


@dmcw.route('/Click', methods=["POST", "GET"])
def click_xy_route():
    try:
        res = request.get_json(force=True)
        result = clickbyxy(elementx=res['elemx'], elementy=res['elemy'])
        return RestResult(ERROR_SUCCESS, data=result, msg='Success').to_json()
    except:
        return RestResult(ERROR_RUN_EXCEPT, data=False, msg=traceback.format_exc()).to_json()


@dmcw.route('/getpostionBypic', methods=["POST", "GET"])
def getposition_bypic_route():
    try:
        res = request.get_json(force=True)
        result = getpositionbypic(picpath=res['picpath'])
        print(result)
        return RestResult(ERROR_SUCCESS, data=result, msg="Success").to_json()
    except:
        return RestResult(ERROR_RUN_EXCEPT, data=False, msg=traceback.format_exc()).to_json()


@dmcw.route('/clickBypic', methods=["POST", "GET"])
def click_bypic_route():
    try:
        res = request.get_json(force=True)
        result = clickbypic(picpath=res['picpath'])
        return RestResult(ERROR_SUCCESS, data=result, msg="Success").to_json()
    except:
        return RestResult(ERROR_RUN_EXCEPT, data=False, msg=traceback.format_exc()).to_json()
    
    
@dmcw.route('/doubleclickBypic', methods=["POST", "GET"])
def doubleclick_bypic_route():
    try:
        res = request.get_json(force=True)
        result = doubleclickbypic(picpath=res['picpath'])
        return RestResult(ERROR_SUCCESS, data=result, msg="Success").to_json()
    except:
        return RestResult(ERROR_RUN_EXCEPT, data=False, msg=traceback.format_exc()).to_json()


@dmcw.route('/screenContainpic', methods=["POST", "GET"])
def screen_containpic_route():
    try:
        res = request.get_json(force=True)
        result = screencontainpic(picpath=res['picpath'])
        return RestResult(ERROR_SUCCESS, data=result, msg="Success").to_json()
    except:
        return RestResult(ERROR_RUN_EXCEPT, data=False, msg=traceback.format_exc()).to_json()


@dmcw.route('/inputByposition', methods=["POST", "GET"])
def input_byposition_route():
    try:
        res = request.get_json(force=True)
        result = inputbyposition(elementx=res['x'], elementy=res['y'], text=res['text'])
        return RestResult(ERROR_SUCCESS, data=result, msg="Success").to_json()
    except:
        return RestResult(ERROR_RUN_EXCEPT, data=False, msg=traceback.format_exc()).to_json()


@dmcw.route('/inputBypic', methods=["POST", "GET"])
def input_bypicroute():
    try:
        res = request.get_json(force=True)
        result = inputbypic(picpath=res['picpath'], x=res['x'], y=res['y'], text=res['text'])
        return RestResult(ERROR_SUCCESS, data=result, msg="Success").to_json()
    except:
        return RestResult(ERROR_RUN_EXCEPT, data=False, msg=traceback.format_exc()).to_json()


@dmcw.route('/clickBypicoffset', methods=["POST", "GET"])
def click_bypic_offsetroute():
    try:
        res = request.get_json(force=True)
        result = clickbypic_offset(picpath=res['picpath'], x=res['x'], y=res['y'])
        return RestResult(ERROR_SUCCESS, data=result, msg="Success").to_json()
    except:
        return RestResult(ERROR_RUN_EXCEPT, data=False, msg=traceback.format_exc()).to_json()