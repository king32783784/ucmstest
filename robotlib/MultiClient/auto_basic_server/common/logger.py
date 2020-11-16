import logging
from logging.handlers import RotatingFileHandler


class Logger(object):
    def __init__(self, log_path, level='debug'):
        self.logger = logging.getLogger()
        if level.lower() == 'debug':
            Level = logging.DEBUG
        elif level.lower() == 'info':
            Level = logging.INFO
        elif level.lower() == 'warn':
            Level = logging.WARN
        elif level.lower() == 'warning':
            Level = logging.WARNING
        elif level.lower() == 'error':
            Level = logging.ERROR
        else:
            Level = logging.INFO
        self.logger.setLevel(Level)
        fmt = logging.Formatter('[%(asctime)s] [%(levelname)s] [%(filename)s %(funcName)s:%(lineno)d] %(message)s',
                                '%Y-%m-%d %H:%M:%S')
        rf = RotatingFileHandler(log_path, 'a', 200000, 9, 'utf-8')
        rf.setLevel(logging.DEBUG)
        rf.setFormatter(fmt)
        self.logger.addHandler(rf)

        sh = logging.StreamHandler()
        sh.setFormatter(fmt)
        self.logger.addHandler(sh)


log = Logger('console_server.log').logger
