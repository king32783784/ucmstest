# -*- coding: utf-8 -*-
# @Time : 2020/10/27
# @Author : lipeng
# @File : common_logic.py
import traceback


def dispose_tuple(src_tuple):
    dst_list = list()
    for tuple_obj in src_tuple:
        if isinstance(tuple_obj, tuple):
            rst = dispose_tuple(tuple_obj)
        elif isinstance(tuple_obj, list):
            rst = dispose_list(tuple_obj)
        elif isinstance(tuple_obj, bytes):
            try:
                rst = tuple_obj.decode()
            except:
                print(traceback.format_exc())
                rst = tuple_obj.decode('gbk')
        else:
            rst = tuple_obj
        dst_list.append(rst)
    return dst_list


def dispose_list(src_list):
    dst_list = list()
    for list_obj in src_list:
        if isinstance(list_obj, tuple):
            rst = dispose_tuple(list_obj)
        elif isinstance(list_obj, list):
            rst = dispose_list(list_obj)
        elif isinstance(list_obj, bytes):
            try:
                rst = list_obj.decode()
            except:
                rst = list_obj.decode('gbk')
        else:
            rst = list_obj
        dst_list.append(rst)
    return dst_list


def dispose_result(result):
    if isinstance(result, tuple):
        result = dispose_tuple(result)
    elif isinstance(result, list):
        result = dispose_list(result)
    elif isinstance(result, bytes):
        try:
            result = result.decode()
        except:
            result = result.decode('gbk')
    return result
