# -*- coding: utf-8 -*-
# @Time : 2020/10/27
# @Author : lipeng
# @File : common_logic.py

from flask import jsonify

SAVE_SCREENSHOT_SUCCESS = 1090
SAVE_SCREENSHOT_FAILED = 1091
ERROR_SUCCESS = 0
ERROR_RUN_EXCEPT = 1
FILE_NOT_EXIST = 40004


class RestResult(object):
    def __init__(self, errno, msg=None, data=None):
        self.errno = errno
        self.msg = msg
        self.data = data

    def is_error(self):
        return True if self.errno != ERROR_SUCCESS else False

    def to_json(self):
            return jsonify({'errno': self.errno, 'msg': self.msg, 'data': self.data})

    def __str__(self):
        return "错误码-[{}] 错误信息-[{}]".format(self.errno, self.msg)
