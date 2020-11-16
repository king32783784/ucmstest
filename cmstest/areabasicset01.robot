*** Settings ***
Library           SeleniumLibrary
Library           MultiClient
Library           CmsBase
Resource          lib/base.robot
Resource          lib/softcenter.robot
Resource          lib/area.robot
Resource          lib/task.robot
Resource          lib/dmcwui.robot
Resource          lib/usercenter.robot

*** Test Cases ***
235000-【回归测试】超级管理员--区域中心，终端默认配置修改
    ${cmsweb}=    Get Single Option Value    common    cmsweb
    ${browser}=    Get Single Option Value    common    browser
    ${login_user}=    Get Single Option Value    common    adminuser
    ${login_passwd}=    Get Single Option Value    common    adminpasswd
    ${loginit}=    Get Single Option Value    cmdline    loginit
    ${cmdline}=    Get Single Option Value    cmdline    imagepath
    ${areaname}=    Get Single Option Value    area   areaname
    ${filepath}=    Get Single Option Value    file    picpath
    Comment    log init
    Run Cmd    ${loginit}
    Sleep    3
    Login Cms   ${cmsweb}    ${login_user}    ${login_passwd}
    Set Basicset Wallpaper   ${areaname}    ${filepath}
    Wait Until Keyword Succeeds    2 min    10 sec    Run Cmd Should Be Contain    ${cmdline}     api
    ${ret}=     Run Cmd Index    ${cmdline}    ${0}
    log    ${ret}
    ${css}=    Join Str    None    css:    img[src='    ${ret}    ']
    Page Should Contain Element    ${css}
    Close All Browsers


124449-【初始化配置】完成配置界面--LDAP管理员登陆限制控制中心更新
    Start Control
    Sleep   1
    Screen Should Not Contain Pic    control_gengxin.png
    Click By Pic    control_close.png
    
245980-【【控制中心帐户入口管控策略优化】加入管控后,LDAP管理员控制中心--账户入口隐藏
    Start Control
    Screen Should Not Contain Pic    control_zhanghu.png
    Click By Pic    control_close.png

