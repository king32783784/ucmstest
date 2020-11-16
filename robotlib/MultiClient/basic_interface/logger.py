import logging
import os

class Logger(object):
    def __init__(self, log_path):
        self.logger = logging.getLogger(log_path)
        self.logger.setLevel(logging.DEBUG)
        fmt = logging.Formatter('[%(asctime)s] [%(levelname)s] [%(filename)s %(funcName)s:%(lineno)d] %(message)s',
                                '%Y-%m-%d %H:%M:%S')
        sh = logging.StreamHandler()
        sh.setFormatter(fmt)
        self.logger.addHandler(sh)
        fh = logging.FileHandler(log_path)
        fh.setFormatter(fmt)
        self.logger.addHandler(fh)

    def debug(self, text, *args):
        result = text
        if args:
            result = text.format(*args)
        self._log(result, logging.DEBUG)

    def error(self, text, *args):
        result = text
        if args:
            result = text.format(*args)
        self._log(result, logging.ERROR)

    def info(self, text, *args):
        result = text
        if args:
            result = text.format(*args)
        self._log(result, logging.INFO)

    def warn(self, text, *args):
        result = text
        if args:
            result = text.format(*args)
        self._log(result, logging.WARN)

    def fatal(self, text, *args):
        result = text
        if args:
            result = text.format(*args)
        self._log(result, logging.FATAL)

    def _log(self, data, level):
        try:
            self.logger.log(level, data)
        except:
            pass


log_path = os.path.abspath(os.path.join(os.path.dirname(__file__), "../auto_frame.log"))
log = Logger(log_path).logger