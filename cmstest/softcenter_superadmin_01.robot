*** Settings ***
Library           SeleniumLibrary
Library           MultiClient
Resource          lib/base.robot
Resource          lib/softcenter.robot
Library           CmsBase
Resource          lib/area.robot
Resource          lib/task.robot
Resource          lib/dmcwui.robot
Resource          lib/usercenter.robot

*** Test Cases ***
235067-【回归测试】超级管理员--标注已标注过的软件
    ${cmsweb}=   Get Single Option Value    common    cmsweb
    ${browser}=   Get Single Option Value    common    browser
    ${login_user}=   Get Single Option Value    common    adminuser
    ${login_passwd}=   Get Single Option Value    common    adminpasswd
    Login Cms    ${cmsweb}    ${login_user}    ${login_passwd}
    Click Element    xpath://*[@id='m_ver_menu']/ul/li[5]/a/span
    ${status}=    Check Software Ismarkd    arch-test
    Run Keyword If    '${status}' == 'True'    Softcenter Op    arch-test    RM
    # 第一次标记可以成功
    Marksoftware    arch-test    应用软件    arch-test    True
    # 再次添加，提示"该软件在该区域内已被添加过!"
    Marksoftware    arch-test    应用软件    arch-test    False
    Close All Browsers


235068-【回归测试】超级管理员--超级管理员查看软件标注
    ${cmsweb}=   Get Single Option Value    common    cmsweb
    ${browser}=   Get Single Option Value    common    browser
    ${login_user}=   Get Single Option Value    common    adminuser
    ${login_passwd}=   Get Single Option Value    common    adminpasswd
    ${login_user1}=   Get Single Option Value   secondaryadministrator    webadmin01
    ${login_passwd1}=   Get Single Option Value    secondaryadministrator    webpasswd01
    Comment    登录二级管理员标注
    Login Cms    ${cmsweb}    ${login_user1}    ${login_passwd1}
    ${status}=    Check Software Ismarkd    emboss
    Run Keyword If    '${status}' == 'False'    Marksoftware    emboss-test   应用软件    emboss    True
    Close All Browsers
    Login Cms    ${cmsweb}    ${login_user}    ${login_passwd}
    Check Software    emboss
    Close All Browsers


234995-【回归测试】超级管理员--软件标注
    ${cmsweb}=   Get Single Option Value    common    cmsweb
    ${browser}=   Get Single Option Value    common    browser
    ${login_user}=   Get Single Option Value    common    adminuser
    ${login_passwd}=   Get Single Option Value    common    adminpasswd
    ${softname_alias}=     Get Single Option Value    software    movie_alias
    ${softname_deb}=    Get Single Option Value    software    movie_debname
    ${softname_id}=    Get Single Option Value    software    movie_id_amd
    ${cmd_softinstcheck}=    Get Single Option Value    cmdline    softinst_status_movie
    ${cmdline}=    Get Single Option Value    cmdline    softupdatelog
    ${areaname}=    Get Single Option Value    area    areaname
    ${cmdline_software}=    Get Single Option Value    cmdline    checksoft_shortcut
    ${softstatus}=    Run Cmd Checkret   ${cmd_softinstcheck}   deepin-movie
    Run Keyword If    '${softstatus}' == 'False'    Login Cms    ${cmsweb}    ${login_user}    ${login_passwd}
    Run Keyword If    '${softstatus}' == 'False'    Install Soft For Client    ${softname_deb}    ${areaname}    ${softname_alias}    ${softname_id}
    Comment   Software should be installed on client
    Wait Until Keyword succeeds   1 min    10 sec     Run Cmd Should Be Contain    ${cmdline_software}    deepin-movie.desktop
    Close All Browsers


235061-【回归测试】超级管理员--LADP管理员用户终端详情已装软件列表
    ${cmsweb}=   Get Single Option Value    common    cmsweb
    ${browser}=   Get Single Option Value    common    browser
    ${login_user}=   Get Single Option Value    common    adminuser
    ${login_passwd}=   Get Single Option Value    common    adminpasswd
    ${softname_alias}=     Get Single Option Value    software    movie_alias
    ${softname_deb}=    Get Single Option Value    software    movie_debname
    ${softname_id}=    Get Single Option Value    software    movie_id_amd
    ${cmd_softinstcheck}=    Get Single Option Value    cmdline    softinst_status_movie
    ${cmdline}=    Get Single Option Value    cmdline    softupdatelog
    ${areaname}=    Get Single Option Value    area    areaname
    ${cmdline_software}=    Get Single Option Value    cmdline    checksoft_shortcut
    ${softstatus}=    Run Cmd Checkret   ${cmd_softinstcheck}   deepin-movie
    Login Cms    ${cmsweb}    ${login_user}    ${login_passwd}
    Run Keyword If    '${softstatus}' == 'False'    Install Soft For Client    ${softname_deb}    ${areaname}    ${softname_alias}    ${softname_id}
    Comment   Software should be installed on client
    Wait Until Keyword succeeds   1 min    10 sec     Run Cmd Should Be Contain    ${cmdline_software}    deepin-movie.desktop
    Comment    Deepin-music should be in client details software installed list.
    ${softstatus}=    Checksoft_Client    ${softname_alias}    test-PC
    Should Be True    ${softstatus}
    Close All Browsers


234999-【回归测试】超级管理员--区域中心添加软件
    ${cmsweb}=   Get Single Option Value    common    cmsweb
    ${browser}=   Get Single Option Value    common    browser
    ${login_user}=   Get Single Option Value    common    adminuser
    ${login_passwd}=   Get Single Option Value    common    adminpasswd
    ${softname_alias}=     Get Single Option Value    software    movie_alias
    ${softname_deb}=    Get Single Option Value    software    movie_debname
    ${softname_id}=    Get Single Option Value    software    movie_id_amd
    ${cmd_softinstcheck}=    Get Single Option Value    cmdline    softinst_status_movie
    ${cmdline}=    Get Single Option Value    cmdline    softupdatelog
    ${areaname}=    Get Single Option Value    area    areaname
    ${cmdline_software}=    Get Single Option Value    cmdline    checksoft_shortcut
    ${softstatus}=    Run Cmd Checkret   ${cmd_softinstcheck}   deepin-movie
    Login Cms    ${cmsweb}    ${login_user}    ${login_passwd}
    Run Keyword If    '${softstatus}' == 'False'    Install Soft For Client    ${softname_deb}    ${areaname}    ${softname_alias}    ${softname_id}
    Wait Until Keyword succeeds   1 min    10 sec     Run Cmd Should Be Contain    ${cmdline_software}    deepin-movie.desktop
    Check Softstatus Inarea    ${softname_alias}   ${areaname}
    Close All Browsers


235065-【回归测试】超级管理员--LADP管理员用户人员详情软件使用记录
    ${cmsweb}=   Get Single Option Value    common    cmsweb
    ${browser}=   Get Single Option Value    common    browser
    ${login_user}=   Get Single Option Value    common    adminuser
    ${login_passwd}=   Get Single Option Value    common    adminpasswd
    ${softname_alias}=     Get Single Option Value    software    movie_alias
    ${softname_deb}=    Get Single Option Value    software    movie_debname
    ${softname_id}=    Get Single Option Value    software    movie_id_amd
    ${cmd_softinstcheck}=    Get Single Option Value    cmdline    softinst_status_movie
    ${cmdline}=    Get Single Option Value    cmdline    softupdatelog
    ${areaname}=    Get Single Option Value    area    areaname
    ${cmdline_software}=    Get Single Option Value    cmdline    checksoft_shortcut
    Login Cms    ${cmsweb}    ${login_user}    ${login_passwd}
    Comment    检查客户端是否已安装对应软件
    ${softtest}=    Run Cmd_checkret    ${cmdline_software}    deepin-movie.desktop
    Run Keyword If    '${softtest}' == 'False'    Install Soft For Client    ${softname_deb}    ${areaname}    ${softname_alias}    ${softname_id}
    Sleep    5
    Double Click By Pic    movie_icon.png
    sleep    10
    Click By Pic    x_gray.png
    Sleep    3
    Run Cmd    sudo systemctl restart dmcg
    Wait Until Keyword Succeeds    2 min    10 sec   Check Software Usagerecord Inpersonnel    ${softname_alias}   auto01
    Close All Browsers


235004-【回归测试】超级管理员--区域中心-区内软件移除
    ${cmsweb}=   Get Single Option Value    common    cmsweb
    ${browser}=   Get Single Option Value    common    browser
    ${login_user}=   Get Single Option Value    common    adminuser
    ${login_passwd}=   Get Single Option Value    common    adminpasswd
    ${softname_alias}=     Get Single Option Value    software    movie_alias
    ${softname_deb}=    Get Single Option Value    software    movie_debname
    ${softname_id}=    Get Single Option Value    software    movie_id_amd
    ${cmd_softinstcheck}=    Get Single Option Value    cmdline    softinst_status_movie
    ${cmdline}=    Get Single Option Value    cmdline    softupdatelog
    ${areaname}=    Get Single Option Value    area    areaname
    ${cmdline_software}=    Get Single Option Value    cmdline    checksoft_shortcut
    Login Cms    ${cmsweb}    ${login_user}    ${login_passwd}
    Comment    检查客户端是否已安装对应软件
    ${softtest}=    Run Cmd Checkret    ${cmdline_software}    deepin-movie.desktop
    Run Keyword If    '${softtest}' == 'False'    Install Soft For Client    ${softname_deb}    ${areaname}    ${softname_alias}    ${softname_id}
    Comment   Software should be installed on client
    Wait Until Keyword Succeeds    2 min    10 sec    Run Cmd Should Be Contain    ${cmdline_software}    deepin-movie.desktop
    Comment    Remove software from area software installed list
    Enter Area    ${areaname}
    Do Softop Inarea Single    ${softname_alias}    RM
    Comment   Software should be uninstalled on client
    Wait Until Keyword Succeeds    2 min    10 sec    Run Cmd Should Not Contain    ${cmdline_software}    deepin-movie.desktop
    Close All Browsers


235005-【回归测试】超级管理员--软件中心移除软件标注
    ${cmsweb}=   Get Single Option Value    common    cmsweb
    ${browser}=   Get Single Option Value    common    browser
    ${login_user}=   Get Single Option Value    common    adminuser
    ${login_passwd}=   Get Single Option Value    common    adminpasswd
    ${softname_alias}=     Get Single Option Value    software    movie_alias
    ${softname_deb}=    Get Single Option Value    software    movie_debname
    ${softname_id}=    Get Single Option Value    software    movie_id_amd
    ${cmd_softinstcheck}=    Get Single Option Value    cmdline    softinst_status_movie
    ${areaname}=    Get Single Option Value    area    areaname
    ${cmdline_software}=    Get Single Option Value    cmdline    checksoft_shortcut
    Login Cms    ${cmsweb}    ${login_user}    ${login_passwd}
    Comment    检查客户端是否已安装对应软件
    ${softtest}=    Run Cmd Checkret    ${cmdline_software}    deepin-movie.desktop
    Run Keyword If    '${softtest}' == 'False'    Install Soft For Client    ${softname_deb}    ${areaname}    ${softname_alias}    ${softname_id}
    Wait Until Keyword Succeeds    2 min    10 sec    Run Cmd Should Be Contain    ${cmdline_software}    deepin-movie.desktop
    Softcenter Op    ${softname_alias}    RM
    Comment   Software should be uninstalled on client
    Wait Until Keyword Succeeds    2 min    10 sec    Run Cmd Should Not Contain    ${cmdline_software}    deepin-movie.desktop
    Close All Browsers


235000-【回归测试】超级管理员--区域中心，终端默认配置修改
    ${cmsweb}=   Get Single Option Value    common    cmsweb
    ${browser}=   Get Single Option Value    common    browser
    ${login_user}=   Get Single Option Value    common    adminuser
    ${login_passwd}=   Get Single Option Value    common    adminpasswd
    ${loginit}=   Get Single Option Value    cmdline    loginit
    ${cmdline}=   Get Single Option Value    cmdline    imagepath
    ${areaname}=   Get Single Option Value    area   areaname
    ${filepath}=   Get Single Option Value    file    picpath
    Comment    log init
    Run Cmd    ${loginit}
    Sleep    3
    Login Cms   ${cmsweb}    ${login_user}    ${login_passwd}
    Set Basicset Wallpaper   ${areaname}    ${filepath}
    Wait Until Keyword Succeeds    2 min    10 sec    Run Cmd Should Be Contain    ${cmdline}     api
    ${ret}=     Run Cmd Index    ${cmdline}    ${0}
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