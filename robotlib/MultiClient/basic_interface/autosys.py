# -*- coding: utf-8 -*-

from basic_interface.distribute_logic import dispose_request
from basic_interface.logger import log


def get_host_name(ips):
    """获取主机名

    :param ips:         请求接收方的ip(类型只能是str或list)
    :return:            返回str
    """
    route = 'http://{IP}:{BasicServerPort}/auto_sys/getHostName'
    result = dispose_request(ips=ips, route=route)
    log.debug('主机名为：{0}'.format(result))
    return result


def get_system_type(ips):
    """获取系统类型(Windows ,Linux)

    :param ips:         请求接收方的ip(类型只能是str或list)
    :return:            返回str
    """
    route = 'http://{IP}:{BasicServerPort}/auto_sys/get_system_type'
    result = dispose_request(ips=ips, route=route)
    log.debug('系统类型为：{0}'.format(result))
    return result


def is_win64(ips):
    """是否是win64位系统
    
    :param ips:         请求接收方的ip(类型只能是str或list)
    :return:            返回bool
    """
    route = 'http://{IP}:{BasicServerPort}/auto_sys/isWin64'
    result = dispose_request(ips=ips, route=route)
    log.debug('是否为win64位系统？{0}'.format(result))
    return result


def get_local_ip():
    """获取本地的ip"""
    try:
        import socket
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.connect(('8.8.8.8', 80))
        ip = s.getsockname()[0]
        return ip
    except:
        raise Exception('get_local_ip Failed')
    finally:
        s.close()
