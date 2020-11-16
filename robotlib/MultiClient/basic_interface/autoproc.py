# -*- coding: utf-8 -*-
from MultiClient.basic_interface.distribute_logic import dispose_request
from MultiClient.basic_interface.logger import log
from MultiClient.config import Client_IP


def exec_cmd(cmd, cwd=None, is_wait=True, timeout=15, ips=Client_IP):
    """执行指令

    :param cmd:         指令
    :param cwd:         路径
    :param is_wait:     是否等待
    :param timeout:     超时时间
    :param ips:         请求接收方的ip(类型只能是str或list)
    :return:            返回值为str
    """
    route = 'http://{IP}:{BasicServerPort}/auto_proc/exec_cmd'
    param_map = {"cmd": cmd, "cwd": cwd, "is_wait": is_wait, "timeout": timeout}
    result = dispose_request(ips=ips, route=route, param_map=param_map)
    print(result)
    log.debug('在路径:{0}执行{1}，结果为：{2}'.format(cwd, cmd, result))
    return result

if __name__ == "__main__":
    exec_cmd("ifconfig", is_wait=True)
