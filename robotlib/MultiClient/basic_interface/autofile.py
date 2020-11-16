# -*- coding: utf-8 -*-
# @Time : 2020/10/27
# @Author : lipeng
# @File : autofile.py

from basic_interface.distribute_logic import dispose_request
from basic_interface.logger import log
from config import Client_IP


def exist_path(path, ips=Client_IP):
    """路径是否存在
    :param path:    一个路径
    :param ips:     请求接收方的ip(类型只能是str或list)
    :return:        返回值为bool
    """
    param_map = {'path': path}
    route = "http://{IP}:{BasicServerPort}/auto_file/existPath"
    result = dispose_request(ips=ips, route=route, param_map=param_map)
    log.debug('路径:{0}是否存在? 结果为：{1}'.format(path, result))
    return result


if __name__ == "__main__":
    pass
