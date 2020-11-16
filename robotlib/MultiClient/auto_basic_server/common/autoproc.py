#!/usr/bin/python3
# -*- coding: utf-8 -*-
# @File : autoproc.py
# @Author: lipengb@uniontech.com

import subprocess
from common.common_logic import dispose_result
from common.logger import log


def exec_cmd(cmd, cwd=None, is_wait=True, timeout=15):
    """Execute system commands

    :param cmd: Command line conten
    :param cwd: Command file path
    :param is_wait: Whether to wait for the command execution to complete
    :param timeout: Command execution timeout
    :return: Command line execution result
    """
    rst = subprocess.Popen(cmd, cwd=cwd, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                           shell=True)
    if is_wait:
        result = rst.communicate(timeout=timeout)
        result = dispose_result(result)
        log.info(result)
        return result
    else:
        return rst.pid


if __name__ == '__main__':
    print(exec_cmd("ipconfig", cwd=None, is_wait=True, timeout=15))

