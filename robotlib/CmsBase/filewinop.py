#! /usr/bin/env python
# -*- coding: utf-8 -*-
# @File: filewinop.py
# @Author: lipengb@uniontech.com

import win32gui
import win32con
import datetime
from robot.api.deco import keyword


class WinOp(object):
    @keyword(name='Upload File')
    def uploadfile(self, filepath, wintitle=u'打开'):
        """Process file upload pop-up window
        :param filepath:Path to upload file
        :param wintitle:Title of the file upload window
        :return:None

        Examples:
            | Upload File        | /home/test/test.pic

        """
        dialog = win32gui.FindWindow('#32770', u'{}'.format(wintitle))
        ComboBoxEx32 = win32gui.FindWindowEx(dialog, 0, 'ComboBoxEx32', None)
        ComboBox = win32gui.FindWindowEx(ComboBoxEx32, 0, 'ComboBox', None)
        Edit = win32gui.FindWindowEx(ComboBox, 0, 'Edit', None)
        button = win32gui.FindWindowEx(dialog, 0, 'Button', None)
        win32gui.SendMessage(Edit, win32con.WM_SETTEXT, None, filepath)
        win32gui.SendMessage(dialog, win32con.WM_COMMAND, 1, button)

    @keyword(name='Get Next Time')
    def getnexttime(self, minutes=None):
        """Get the time list of after many minutes.

        :param minutes:How many Minutes which dou you want after
        :return: A list of new date

        Examples:
           /Get Next Time    3
        """
        if minutes is not None:
            date = datetime.datetime.now() + datetime.timedelta(minutes=minutes)
        else:
            date = datetime.datetime.now()
        datelist = date.strftime("%Y-%m-%d-%H-%M-%S-%w").split("-")
        datelist = list(map(int, datelist))
        return datelist


if __name__ == "__main__":
    test = WinOp()
