# -*- coding: utf-8 -*-
import hashlib
import time

def handle_timeout(func, timeout, *params, **param_map):
    """在超时范围内执行
    
    :param func:        函数名
    :param timeout:     timeout为数值或元组（超时时长,间隔时间）
    :param params:
    :param param_map:
    """
    interval = 0.6
    if type(timeout) == tuple:
        timeout, interval = timeout
    rst = None
    while timeout > 0:
        time_start = time.perf_counter()
        try:
            rst = func(*params, **param_map)
        except:
            pass
        if rst and not is_except(rst):
            break
        time.sleep(interval)
        timeout -= time.perf_counter() - time_start
    return rst


def handle_timeout_check_expect(func, timeout, expect_result, *params, **param_map):
    """在超时范围内执行,当函数值与期望结果相同时，直接退出

    :param func:        函数名
    :param timeout:     timeout为数值或元组（超时时长,间隔时间）
    :param expect_result:  函数返回的期望值 支持匹配不期望值 {"not_except":XXX}
    :param params:
    :param param_map:
    """

    interval = 0.6
    if type(timeout) == tuple:
        timeout, interval = timeout
    rst = None
    while timeout > 0:
        time_start = time.perf_counter()
        rst = func(*params, **param_map)
        if isinstance(rst, bytes):
            rst = rst.decode()
        if rst == expect_result and not is_except(rst):
            break
        elif isinstance(expect_result, list) and rst in expect_result:
            break
        elif isinstance(expect_result, dict) and expect_result.get('not_except') and rst != expect_result.get(
                'not_except'):
            break
        else:
            time.sleep(interval)
            timeout -= time.perf_counter() - time_start
    return rst


def is_except(e, e_type=Exception):
    """判断是否为异常"""
    return isinstance(e, e_type)


def md5(data):
    """计算数据的md5"""
    if isinstance(data, str):
        data = data.encode('utf-8')
    m = hashlib.md5()
    m.update(data)
    return m.hexdigest()


def sha1(data):
    """计算数据的sha1"""
    if isinstance(data, str):
        data = data.encode()
    m = hashlib.sha1()
    m.update(data)
    return m.hexdigest()


if __name__ == '__main__':
    print(md5("121313"))
    print(sha1("112131adfasf"))