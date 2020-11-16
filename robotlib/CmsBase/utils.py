#! /usr/bin/env python
# -*- coding: utf-8 -*-
# @File: utils.py
# @Author: lipengb@uniontech.com

import random
import string
from robot.api.deco import keyword


class Utils(object):
    @keyword(name='Make Random Str')
    def makeroundstr(self, length):
        """Generate random string of specified length

        :param length: length of random string
        :return: string

        Example:
        Make Random Str    |   10
        """
        return ''.join(random.sample(string.ascii_letters + string.digits, int(length)))

    @keyword(name='Join Str')
    def strjoin(self, joiner=None, *args):
        """String splicing

        :param joiner: Connector between characters
        :param args: string list
        :return: The spliced string

        Example:
            Join Str    | -    / test /  test1
        """
        if joiner is None:
            return ''.join(args)
        else:
            return '{}'.format(joiner).join(args)

    @keyword(name='Get Phone No')
    def getphone(self):
        """Generate random mobile phone number

        :return:
        """
        pefixlist = ["130", "131", "132", "133", "134", "135", "136", "137", "138", "139", "147", "150", "151", "152",
                     "153", "155", "156", "157", "158", "159", "185", "186", "187", "188"]
        return random.choice(pefixlist) + "".join(random.choice("0123456789") for i in range(8))


if __name__ == '__main__':
    test = Utils()
    print(test.getphone())
