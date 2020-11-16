#! /usr/bin/env python
# -*- coding: utf-8 -*-
# @File : main.py
# @Author: lipengb@uniontech.com


from flask import Flask
from common.logger import log
from routes.autofile_blueprint import auto_file
from routes.autosys_blueprint import auto_sys
from routes.autoproc_blueprint import auto_proc
from routes.dmcw_blueprint import dmcw


app = Flask(__name__)
app.register_blueprint(auto_file)
app.register_blueprint(auto_sys)
app.register_blueprint(auto_proc)
app.register_blueprint(dmcw)


if __name__ == '__main__':
    log.info("开始运行BASIC_SERVER,端口:20000...")
    app.run(host='0.0.0.0', port=20000, debug=True)
