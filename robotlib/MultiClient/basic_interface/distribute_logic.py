# -*- coding: utf-8 -*-
# @Time : 2020/2/29 16:12 
# @Author : lipeng 
# @File : distribute_logic.py

import json
import time
import requests
from nose.tools import assert_true
from concurrent.futures._base import Future
from concurrent.futures.thread import ThreadPoolExecutor

from MultiClient.config import get_basic_server_port

basic_server_port = get_basic_server_port()


def parse_response(response, check_type=True):
    """解析响应结果，并进行校验

    :param check_type:
    :param response:    响应结果
    :return:            返回json串
    """
    if check_type is True:
        result = check_true(response)
    elif check_type is False:
        result = check_false(response)
    elif check_type is None:
        result = no_check(response)
    else:
        raise Exception('check_type参数类型错误')
    return result


def check_true(response):
    """检查返回的结果是否为True

    :param response:    响应结果
    :return:            返回json串
    """
    print(response.text)
    result = json.loads(response.text)
    assert_true(result['errno'] == 0, msg='Error;{0}'.format(result['msg']))
    return result.get('data')


def check_false(response):
    """检查返回的结果是否为False

    :param response: 响应结果
    :return:  返回bool
    """
    result = json.loads(response.text)
    assert_true(result['errno'] == 1, msg='Error;{0}'.format(result['msg']))
    return result.get('data')


def no_check(response):
    """对返回结果不进行校验，由业务根据返回值做相应处理

       :param response: 响应结果
       :return:  返回bool
       """
    result = json.loads(response.text)
    return result.get('data')


class AutoThreadPoolExecute(ThreadPoolExecutor):

    def __init__(self, max_workers=5):
        super(AutoThreadPoolExecute, self).__init__(max_workers)

    @staticmethod
    def wait_completed(thread_dict, timeout=(20, 1)):
        interval = 0.6
        complete_flg = len(thread_dict.keys())
        if isinstance(timeout, tuple):
            timeout, interval = timeout

        while timeout > 0:
            time_start = time.perf_counter()

            for ip, thread_obj in thread_dict.items():
                if not isinstance(thread_obj, Future):
                    continue
                elif not thread_obj.done():
                    continue
                else:
                    thread_dict[ip] = thread_obj.result()
                    complete_flg = complete_flg - 1
            if complete_flg == 0:
                return thread_dict

            time.sleep(interval)
            timeout -= time.perf_counter() - time_start
        raise Exception("=====ThreadPoolExecute Timeout=====")

    def multhread_pool(self, ip_list: list, func, timeout=20, *args, **kwargs):
        thread_dict = dict()
        for ip in ip_list:
            if func == send_post:
                # rst = re.sub(r"{IP}", ip, kwargs['route'])
                rst = kwargs["route"].format(IP=ip, BasicServerPort=basic_server_port)
                thread_obj = self.submit(send_post, route=rst, data=kwargs['data'])
            else:
                thread_obj = self.submit(func, *args, **kwargs)
            thread_dict.setdefault(ip, thread_obj)

        return self.wait_completed(thread_dict, timeout)


def send_post(route, data):
    if not data:
        response = requests.get(route)
    else:
        data_json = json.dumps(data)
        response = requests.post(route, data_json)
    result = parse_response(response)
    print(result)
    return result


def dispose_request(ips: (str, list), route: str, param_map=None, timeout=20):
    """ 分发请求

    :param ips: 只支持str和list
    :param route: 接口路由
    :param param_map: 参数字典
    :param timeout:
    :return:
    """
    print(route, ips, param_map)
    if isinstance(ips, str):
        route = route.format(IP=ips, BasicServerPort=basic_server_port)
        print(route)
        return send_post(route, param_map)
    else:
        thread_pool = AutoThreadPoolExecute()
        return thread_pool.multhread_pool(ips, send_post, timeout, route=route, data=param_map)


def assert_true_dict(result: dict, msg=None):
    for key, value in result.items():
        if msg:
            msg = '[{ip}]: '.format(ip=key)+msg
        assert_true(value, msg=msg)



if __name__ == "__main__":
    ip_list = ["127.0.0.1", '10.95.163.114', "10.95.163.133"]
    # ip_list = "127.0.0.1"
    # ip_list = 22
    print(dispose_request(ip_list, route="http://{IP}:10002/auto_file/existPath/", param_map={'path': r"F:\TeamViewer13_wm.exe"}))
