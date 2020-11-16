#! /usr/bin/env python
# -*- coding: utf-8 -*-
# @File : autofile.py
# @Author: lipengb@uniontech.com

import os


def exist_path(path):
    """ Determine whether the file in the specified path exists

    :param path: input the file path  which would you want to check.
    :type path:  string
    :return: bool
    """
    return os.path.exists(path)


if __name__ == "__main__":
    pass
