*** Settings ***
Library           SeleniumLibrary
Library           MultiClient
Resource          lib/base.robot
Resource          lib/softcenter.robot
Library           CmsBase
Resource          lib/area.robot
Resource          lib/dmcwui.robot
Resource          lib/usercenter.robot


*** Test Cases ***
245981-【控制中心帐户入口管控策略优化】加入管控后,LDAP普通用户控制中心--账户入口隐藏
    start_control
    screen_should_notcontainpic    control_zhanghu.png
    clickbypic    control_close.png
