import sys
import os
from MultiClient.autoproc_rf import *

path = os.path.abspath(os.path.dirname(__file__))
sys.path.insert(0, path)


class MultiClient(AutoProc):
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'