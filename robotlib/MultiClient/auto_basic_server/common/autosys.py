#!/usr/bin/python3
# -*- coding: utf-8 -*-
# @File : autoproc.py
# @Author: lipengb@uniontech.com

import os
import platform
import socket


def get_host_name():
    """Get host name"""
    return socket.gethostname()


def get_system_type():
    """Get system type: Windows Linux"""
    return platform.system()


def get_local_ip():
    """Get local ip"""
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


if __name__ == '__main__':
    print(os.environ)
    print(get_host_name())


