from CmsBase.getconfig import *
from CmsBase.filewinop import *
from CmsBase.utils import *

class CmsBase(ConfigParser, WinOp, Utils):
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'