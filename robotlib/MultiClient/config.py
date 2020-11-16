#! /usr/bin/env python
# -*- coding: utf-8 -*-
# @Time : 2020/10/27
# @Author : lipeng
# @File : config.py

import configparser
import os
import re


ipRex = re.compile(r"\b(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b")


class ConfigParser(object):
    def __init__(self, conf_path="".join([os.path.dirname(os.path.abspath(__file__)), os.path.sep, "config.ini"])):
        """
        :param conf_path: the path of config
        """
        self.conf_path = conf_path
        self.conf = configparser.ConfigParser()
        self.conf.read(self.conf_path, encoding='utf-8')

    def get_all_sections(self):
        """
        :return:获取所有sections
        rtype: list
        """
        return self.conf.sections()

    def get_section_options(self, section):
        """
        :param section:
        :return:options of section
        :rtype:list
        """
        return self.conf.options(section)

    def get_section_items(self, section):
        """
        :param section:
        :return: dict items
        """
        return self.conf.items(section)

    def add_section(self, section):
        """
        :param section: 增加section
        :return: true or false
        """
        if section in self.get_all_sections():
            return False
        else:
            self.conf.add_section(section)
            self.conf.write(open(self.conf_path, "w"))
            return True

    def get_single_option_value(self, section, option):
        return self.conf.get(section, option)

    def set_value(self, section, option, value):
        """
        :param section:
        :param option:
        :param value:
        :return: true or false
        """
        if section in self.get_all_sections():
            self.conf.set(section, option, value)
            self.conf.write(open(self.conf_path, "w"))
            return True
        else:
            return False


def get_client_port():
    """获取终端服务的端口"""
    return int(ConfigParser().get_single_option_value('skylar_server_info', 'client_port'))


def get_basic_server_port():
    """获取basic_server端口"""
    return int(ConfigParser().get_single_option_value('skylar_server_info', 'basic_server_port'))


def get_client_ips():
    """获取实际client_server的ip列表"""
    rst = ConfigParser().get_single_option_value('server_infos', 'client_ips')
    ip_list = ipRex.findall(rst)
    return ip_list


def get_client_ip(index=0):
    """
    获取client_server的ip
    :param index: Client的索引
    :return: IP地址
    """
    Client_IP = get_client_ips()[index]
    return Client_IP


Client_IP = get_client_ip()


