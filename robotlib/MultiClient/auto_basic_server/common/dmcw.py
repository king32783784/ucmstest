#!/usr/bin/python3
# -*- coding: utf-8 -*-
# @File : dmcw.py
# @Author: lipengb@uniontech.com

import pyautogui
import time

from common.logger import log

pyautogui.PAUSE = 2.5


def getpositionbypic(picpath=None):
    """
    get pic's position
    :param picpath:
    :return:
    """
    time.sleep(0.5)
    coordinate = pyautogui.locateCenterOnScreen(picpath, grayscale=False, confidence=0.7)
    if coordinate is not None:
        log.info("{} is found it".format(picpath))
        button_next_x, button_next_y = coordinate
        return button_next_x, button_next_y
    else:
        raise Exception("Pic:{} is not Found".format(picpath))


def clickbyxy(elementx=0, elementy=0):
    """ Click by x ,y

    :param elementx:
    :param elementy:
    :return:
    """
    log.info("Click {0} {1}".format(elementx, elementy))
    pyautogui.click(x=elementx, y=elementy, clicks=1, interval=1, button='left')
    return True


def clickbypic(picpath=None):
    """Clicked by pic

    :param piclist:
    :return:
    """
    time.sleep(0.5)
    coordinate = pyautogui.locateCenterOnScreen(picpath, grayscale=False, confidence=0.7)
    if coordinate is not None:
        log.info("{} is found it".format(picpath))
        button_next_x, button_next_y = coordinate
        time.sleep(0.5)
        pyautogui.click(button_next_x, button_next_y)
        return True
    else:
        raise Exception("Pic:{} is not Found".format(picpath))


def doubleclickbypic(picpath=None):
    """Double clicked by pic

    :param piclist:
    :return:
    """
    time.sleep(0.5)
    coordinate = pyautogui.locateCenterOnScreen(picpath, grayscale=False, confidence=0.7)
    if coordinate is not None:
        log.info("{} is found it".format(picpath))
        button_next_x, button_next_y = coordinate
        time.sleep(0.5)
        pyautogui.doubleClick(button_next_x, button_next_y)
        return True
    else:
        raise Exception("Pic:{} is not Found".format(picpath))


def clickbypic_offset(picpath=None, x=0, y=0):
    """Clicked by pic

    :param piclist:
    :param x:
    :param y:
    :return:
    """
    time.sleep(0.5)
    coordinate = pyautogui.locateCenterOnScreen(picpath, grayscale=False, confidence=0.7)
    if coordinate is not None:
        log.info("{} is found it".format(picpath))
        button_next_x, button_next_y = coordinate
        button_next_y += int(y)
        button_next_x += int(x)
        time.sleep(0.5)
        pyautogui.click(button_next_x, button_next_y)
        return True
    else:
        raise Exception("Pic:{} is not Found".format(picpath))


def screencontainpic(picpath=None):
    """Check pic is or not on Current Screen

    :param piclist:
    :return:
    """
    time.sleep(0.5)
    coordinate = pyautogui.locateCenterOnScreen(picpath, grayscale=False, confidence=0.7)
    if coordinate is not None:
         log.info("Pic {} is found it".format(picpath))
         return True
    else:
        log.info("Pic:{} is not Found".format(picpath))
        return False


def inputbyposition(elementx=0, elementy=0, text=None):
    """ input text by x,y

    :param elementx: X site
    :param elementy: Y site
    :param text: inputtext
    :return:
    """
    pyautogui.click(x=elementx, y=elementy, clicks=1, interval=1, button='left')
    time.sleep(1)
    pyautogui.typewrite(text)
    return True


def inputbypic(picpath=None, x=0, y=0, text=None):
    """input text by pic

    :param x: X site
    :param y: Y site
    :param text: inputtext
    :return:
    """
    time.sleep(0.5)
    coordinate = pyautogui.locateCenterOnScreen(picpath, grayscale=False, confidence=0.7)
    if coordinate is None:
        raise Exception("Pic:{} is not Found".format(picpath))
    else:
        log.info("{} is found it".format(picpath))
        button_next_x, button_next_y = coordinate
        button_next_x += x
        button_next_y += y
        time.sleep(0.5)
        pyautogui.click(button_next_x, button_next_y)
        time.sleep(1)
        pyautogui.typewrite(text)
        return True


if __name__ == '__main__':
    pass
