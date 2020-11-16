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

245979-【控制中心帐户入口管控策略优化】加入管控后,本地管理员控制中心--账户入口隐藏
    Start Control
    Sleep   3
    Screen Should NoT Contain Pic    control_zhanghu.png
    Click By Pic    control_close.png



124445-【初始化配置】完成配置界面--本地管理员登陆限制控制中心更新
    Start Control
    Sleep   3
    Screen Should NoT Contain Pic    control_gengxin.png
    Click By Pic    control_close.png