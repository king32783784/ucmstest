#! /usr/bin/env python
# -*- coding: utf-8 -*-
# @File: getconfig.py
# @Author: lipengb@uniontech.com
import configparser
import os
from robot.api.deco import keyword


class ConfigParser(object):
    def __init__(self, confname="cmsconfig.ini"):
        self.conf_path = "".join([os.path.dirname(os.path.abspath(__file__)), os.path.sep, confname])
        self.conf = configparser.ConfigParser()
        self.conf.read(self.conf_path, encoding='utf-8')

    @keyword(name='Get All Sections')
    def get_all_sections(self):
        """Get all sections

        :return: Sections list
        """
        return self.conf.sections()

    @keyword(name='Get Section Options')
    def get_section_options(self, section):
        """ Get all sections

        :param section:
        :return:options of section
        :rtype:list
        """
        return self.conf.options(section)

    @keyword(name='Get Section Items')
    def get_section_items(self, section):
        """Get Section Items

        :param section:
        :return: dict items
        """
        return self.conf.items(section)

    @keyword(name='Add Section')
    def add_section(self, section):
        """ Add Section
        :param section:
        :return: true or false
        """
        if section in self.get_all_sections():
            return False
        else:
            self.conf.add_section(section)
            self.conf.write(open(self.conf_path, "w"))
            return True

    @keyword(name='Get Single Option Value')
    def get_single_option_value(self, section, option):
        """Get the item corresponding to the specified section

        :param section:
        :param option:
        :return:

        Example:
            | Get Single Option Value    | common    /cmsweb
        """
        return self.conf.get(section, option)

    @keyword(name='Set Value')
    def set_value(self, section, option, value):
        """Modify a specific value in the configuration

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
