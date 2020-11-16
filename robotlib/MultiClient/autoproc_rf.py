#! /usr/bin/env python
# -*- coding: utf-8 -*-
# @File : autoproc_rf.py
# @Author: lipengb@uniontech.com

from MultiClient.basic_interface.autoproc import *
from MultiClient.basic_interface.dmcw import *
from robot.api.deco import keyword
from MultiClient.basic_interface.logger import log

class AutoProc(object):

    @keyword(name="Run Cmd")
    def runcmd(self, cmdline, timeout=30):
        """ Just execute the command

        :param cmdline: command
        :return: Command execution result

        Example:
        Run Cmd | uname -a
        """
        log.info(cmdline)
        ret = exec_cmd(cmdline, timeout)
        return ret

    @keyword(name="Run Cmd Checkret")
    def runcmd_checkret(self, cmdline, expected):
        """The return result after the judgment command is executed must contain the specified string

        :param cmdline: command
        :param expected: specified string
        :return: Bool

        Example:
        Run Cmd Checkret | uname -a | Linux
        """
        log.info(cmdline)
        ret = exec_cmd(cmdline)
        log.info(ret)
        if len(ret) > 0:
            for strtmp in ret:
                if expected in str(strtmp):
                    log.info("cmd line <{0}> operation result is ({1})，contain [{2}]".format(cmdline, ret, expected))
                    return True
        log.info("cmd line <{0}> operation result is ({1})，not contain [{2}]".format(cmdline, ret, expected))
        return False

    @keyword(name="Run Cmd Should Be Contain")
    def runcmd_should_be_contain(self, cmdline, expected):
        """The return result after the judgment command is executed must contain the specified string

        :param cmdline: command
        :param expected: specified string
        :return: Bool

        Example:
        Run Cmd Should Be Contain   |   uname -a  | test
        """
        log.info(cmdline)
        ret = exec_cmd(cmdline)
        log.info(ret)
        if len(ret) > 0:
            for strtmp in ret:
                if expected in str(strtmp):
                    log.info("cmd line <{0}> operation result is ({1})，contain [{2}]".format(cmdline, ret, expected))
                    return True
        raise AssertionError("cmd line <{0}> operation result is ({1})，not contain [{2}]".format(cmdline, ret, expected))

    @keyword(name='Run Cmd Should Not Contain')
    def runcmd_false(self, cmdline, expected):
        """The return result after the judgment command is executed must contain the specified string

        :param cmdline: command
        :param expected: specified string
        :return: Bool

        Example:
        Run Cmd Should Be Contain   |   uname -a  | test
        """
        log.info(cmdline)
        ret = exec_cmd(cmdline)
        log.info(ret)
        if len(ret) > 0:
            for strtmp in ret:
                if expected in str(strtmp):
                    raise AssertionError("cmd line <{0}> operation result is ({1})，contain [{2}]".format(cmdline, ret,
                                                                                                         expected))
        log.info("cmd line <{0}> operation result is ({1})，not contain [{2}]".format(cmdline, ret, expected))
        return True

    @keyword(name='Run Cmd Index')
    def runcmd_index(self, cmdline, index):
        """ Just execute the command, return the contents of the specified location

        :param cmdline: command
        :param index: locatol
        :return: string

        Example:

            Run Cmd Should Be Contain   |   uname -a  | ${1}
        """
        log.info(cmdline)
        ret = exec_cmd(cmdline)
        return ret[index].strip('\n')

    @keyword(name='Click By XY')
    def click_ui(self, x, y):
        """click by x,y

        :param x:
        :param y:
        :return:

        Example:
            Click By XY  | 800   | 600
        """
        click(x, y)

    @keyword(name='Get XY By Pic')
    def getpicsitebypic(self, picname):
        """get pic' x ,y

        :param picname:
        :return: int,int

        Example:
            Get XY By Pic |  test.png
        """
        return getpicsitebypic(picname)

    @keyword(name='Click By Pic')
    def clickbypic(self, picname):
        """ click pic

        :param picname:
        :return:

        Example:
           Click By Pic  | test.png
        """
        clickbypic(picname)

    @keyword(name='Double Click By Pic')
    def doubleclickbypic(self, picname):
        """Double click pic

        :param picname:
        :return:

        Example:
           Double Click By PIC |  test.png
        """
        doubleclickbypic(picname)

    @keyword(name='Screen Should Contain Pic')
    def screencontainpic(self, picname):
        """screen should contain pic

        :param picname:
        :return:

        Example:
            Screen Should Contain Pic  |  test.png
        """
        if screencontainpic(picname):
            return True
        else:
            raise Exception("Not found {} on screen".format(picname))

    @keyword(name='Screen Should Not Contain Pic')
    def screen_should_notcontainpic(self, picname):
        """ screen should not contain pic

        :param picname:
        :return:

        Example:
            Screen Should Not Contain Pic   | test.png
        """
        if screencontainpic(picname):
            raise Exception("Found {} on screen".format(picname))
        else:
            log.info("Not Found {} on screen".format(picname))
            return True

    @keyword(name='Check Pic On Screen')
    def checkpic_onscreen(self, picname):
        """screen should not contain pic

        :param picname:
        :return:

        Example:
            Check Pic On Screen  |  test.png
        """
        if screencontainpic(picname):
            log.info("Found {} on screen".format(picname))
            return True
        else:
            log.info("Not Found {} on screen".format(picname))
            return False

    @keyword(name='Input By XY')
    def inputbyposition(self, x, y, text):
        """ send text
        :param x:
        :param y:
        :param text:
        :return:

        Example:
           Input By XY  |  400  /  300  / test
        """
        inputbyposition(x, y, text)

    @keyword(name='Input By Pic')
    def inputbypic(self, picname, x=0, y=0, text=None):
        """send text by pic

        :param picname:
        :param x:
        :param y:
        :param text:
        :return:

        Example:
           Input By PIC  |  test.png  / test
        """
        inputbypic(picname, int(x), int(y), text)

    @keyword(name='Click By Pic Offset')
    def clickbypic_offset(self, picname, x=0, y=0):
        """ send text by pic and offset

        :param picname:
        :param x:
        :param y:
        :param text:
        :return:

         Example:
           Click By Pic Offset  |  test.png  / -100 / 100
        """
        clickbypic_offset(picname, int(x), int(y))


if __name__ == "__main__":
     pass
