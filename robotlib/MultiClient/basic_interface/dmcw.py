# -*- coding: utf-8 -*-
import os
from MultiClient.basic_interface.distribute_logic import dispose_request
from MultiClient.config import Client_IP


def _getpicpath(picname, ips=Client_IP):
    """
    get pic abspath
    :param picname:
    :return:
    """
    route = 'http://{IP}:{BasicServerPort}/auto_proc/exec_cmd'
    param_map = {"cmd": "pwd", "cwd": None, "is_wait": True, "timeout": 10}
    result = dispose_request(ips=ips, route=route, param_map=param_map)
    localpath = result[0].strip("auto_basic_server\n")
    newpath = os.path.join(localpath, "autopic/{}".format(picname)).replace("\\", "/")
    print("new%s" % newpath)
    return newpath


def click(x, y, ips=Client_IP):
    """
    click by x,y
    :param x:
    :param y:
    :param ips:
    :return:
    """
    param_map = {"elemx": int(x), "elemy": int(y)}
    route = "http://{IP}:{BasicServerPort}/dmcw/Click"
    result = dispose_request(ips=ips, route=route, param_map=param_map)
    return result

def getpicsitebypic(picname, ips=Client_IP):
    """
    Get pic's site by picname
    :param picname:
    :param ips:
    :return:
    """
    picpath = _getpicpath(picname)
    param_map = {"picpath": picpath}
    route = "http://{IP}:{BasicServerPort}/dmcw/getpostionBypic"
    result = dispose_request(ips=ips, route=route, param_map=param_map)
    return result


def clickbypic(picname, ips=Client_IP):
    """
    Click pic
    :param picname:
    :param ips:
    :return:
    """
    picpath = _getpicpath(picname)
    print(picpath)
    param_map = {"picpath": picpath}
    route = "http://{IP}:{BasicServerPort}/dmcw/clickBypic"
    result = dispose_request(ips=ips, route=route, param_map=param_map)
    return result


def doubleclickbypic(picname, ips=Client_IP):
    """Double click pic
    
    :param picname:
    :param ips:
    :return:
    """
    picpath = _getpicpath(picname)
    print(picpath)
    param_map = {"picpath": picpath}
    route = "http://{IP}:{BasicServerPort}/dmcw/doubleclickBypic"
    result = dispose_request(ips=ips, route=route, param_map=param_map)
    return result


def screencontainpic(picname, ips=Client_IP):
    """
    pic should be on screen
    :param picname:
    :param ips:
    :return:
    """
    picpath = _getpicpath(picname)
    param_map = {"picpath": picpath}
    route = "http://{IP}:{BasicServerPort}/dmcw/screenContainpic"
    result = dispose_request(ips=ips, route=route, param_map=param_map)
    return result


def inputbyposition(x, y, text, ips=Client_IP):
    """
    send text to x,y
    :param x:
    :param y:
    :param text:
    :param ips:
    :return:
    """
    param_map = {"x": int(x), "y": int(y), "text": text}
    route = "http://{IP}:{BasicServerPort}/dmcw/inputByposition"
    result = dispose_request(ips=ips, route=route, param_map=param_map)
    return result


def inputbypic(picname=None, x=0, y=0, text=None, ips=Client_IP):
    """
    send text to x,y
    :param x:
    :param y:
    :param text:
    :param ips:
    :return:
    """
    picpath = _getpicpath(picname)
    param_map = {"picpath": picpath, "x": x, "y": y, "text": text}
    route = "http://{IP}:{BasicServerPort}/dmcw/inputBypic"
    result = dispose_request(ips=ips, route=route, param_map=param_map)
    return result

def clickbypic_offset(picname=None, x=0, y=0, ips=Client_IP):
    """
    Click by pic and offset
    :param x:
    :param y:
    :param text:
    :return:
    """
    picpath = _getpicpath(picname)
    param_map = {"picpath": picpath, "x": x, "y": y}
    route = "http://{IP}:{BasicServerPort}/dmcw/clickBypicoffset"
    result = dispose_request(ips=ips, route=route, param_map=param_map)
    return result

if __name__ == "__main__":
    click(18, 1063, ips=Client_IP)
    click(127, 828, ips=Client_IP)
    clickbypic("otherfunc.png", ips=Client_IP)
    _getpicpath("otherfunc.png")

