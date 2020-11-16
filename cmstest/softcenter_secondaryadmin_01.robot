*** Settings ***
Library           SeleniumLibrary
Library           MultiClient
Resource          lib/base.robot
Resource          lib/softcenter.robot
Library           CmsBase
Resource          lib/area.robot

*** Test Cases ***

235077-【回归测试】web二级管理员--软件标注
    ${cmsweb}=    get single option value    common    cmsweb
    ${browser}=    get single option value    common    browser
    ${login_user}=    Get Single Option Value   secondaryadministrator    webadmin01
    ${login_passwd}=    Get Single Option Value    secondaryadministrator    webpasswd01
    ${cmdline_software}=   get single option value    cmdline    checksoft
    login_cms    ${cmsweb}    ${login_user}    ${login_passwd}
    ${softstatus}=    Check_Software_Ismarkd    movie
    Comment    Get software（deepin-music) marked status
    Run Keyword Unless    ${softstatus}    Marksoftware_Byid    deepin-movie    应用软件   music    215937
    check_software    music
    Comment     Check software installed or not on client
    ${softinsall}=     runcmd_checkret    ${cmdline_software}    deepin-movie.desktop
    Comment    Need to be installed if software is not installed
    Run Keyword Unless    ${softinsall}    enter_area    autotest
    Run Keyword Unless    ${softinsall}    add_soft_in_area    movie
    Comment   Software should be installed on client
    ${test}=   runcmd_checkret    ${cmdline_software}    deepin-movie.desktop
    Should be True    ${test}
    Wait Until Keyword succeeds   1 min    10 sec     runcmd_true    ${cmdline_software}    deepin-music.desktop
    Close All Browsers

235152-【回归测试】web二级管理员--二级管理员查看软件标注
    ${cmsweb}=    get single option value    common    cmsweb
    ${browser}=    get single option value    common    browser
    ${login_user}=    get single option value   secondaryadministrator    webadmin01
    ${login_passwd}=    get single option value    secondaryadministrator    webpasswd01
    login_cms    ${cmsweb}    autotest01    abc123
    check_software    movie
    Close All Browsers


235142-【回归测试】web二级管理员--LADP管理员用户终端详情已装软件列表
    ${cmsweb}=    get single option value    common    cmsweb
    ${browser}=    get single option value    common    browser
    ${login_user}=    get single option value   secondaryadministrator    webadmin01
    ${login_passwd}=    get single option value    secondaryadministrator    webpasswd01
    ${cmdline_software}=   get single option value    cmdline    checksoft
    login_cms    ${cmsweb}    ${login_user}    ${login_passwd}
    ${softstatus}=    Check_Software_Ismarkd    movie
    Comment    Get software（deepin-music) marked status
    Run Keyword Unless    ${softstatus}    Marksoftware_Byid    deepin-movie    应用软件   movie    215937
    check_software    music
    Comment     Check software installed or not on client
    ${softinsall}=     runcmd_checkret    ${cmdline_software}    deepin-movie.desktop
    Comment    Need to be installed if software is not installed
    Run Keyword Unless    ${softinsall}    enter_area    autotest
    Run Keyword Unless    ${softinsall}    add_soft_in_area    music
    Comment   Software should be installed on client
    Wait Until Keyword Succeeds    2 min    10 sec    runcmd_true    ${cmdline_software}    deepin-movie.desktop
    Comment    Deepin-music should be in client details software installed list.
    ${softstatus}=    Checksoft_Client    music    test-PC
    Should Be True    ${softstatus}
    Close All Browsers

235081-【回归测试】web二级管理员--区域中心添加软件
    ${cmsweb}=    get single option value    common    cmsweb
    ${browser}=    get single option value    common    browser
    ${login_user}=    get single option value   secondaryadministrator    webadmin01
    ${login_passwd}=    get single option value    secondaryadministrator    webpasswd01
    ${cmdline_software}=   get single option value    cmdline    checksoft
    ${softname}=    get single option value    software    softname03
    ${areaname}=    get single option value    area    areaname
    ${sofedeb}=    get single option value    software    softtest02
    ${softdesktop}=    get single option value    software    softdesktop2
    login_cms    ${cmsweb}    ${login_user}    ${login_passwd}
    ${softstatus}=    Check_Software_Ismarkd    ${softname}
    Comment    Get software（deepin-music) marked status
    Run Keyword Unless    ${softstatus}    Marksoftware_Byid    ${sofedeb}    应用软件   ${softname}    215937
    check_software    ${softname}
    Comment     Check software installed or not on client
    ${softinsall}=     runcmd_checkret    ${cmdline_software}    ${softdesktop}
    Comment    Need to be installed if software is not installed
    Run Keyword Unless    ${softinsall}    enter_area    ${areaname}
    Run Keyword Unless    ${softinsall}    add_soft_in_area    ${softname}
    Comment   Software should be installed on client
    Wait Until Keyword Succeeds    2 min    10 sec    runcmd_true    ${cmdline_software}   ${softdesktop}
    Comment    Deepin-music should be in area  software installed list.
    check_softstatus_inarea    ${softname}   ${areaname}
    Close All Browsers


235146-【回归测试】web二级管理员--LADP管理员用户人员详情软件使用记录
    ${cmsweb}=    get single option value    common    cmsweb
    ${browser}=    get single option value    common    browser
    ${login_user}=    get single option value   secondaryadministrator    webadmin01
    ${login_passwd}=    get single option value    secondaryadministrator    webpasswd01
    login_cms    ${cmsweb}    ${login_user}    ${login_passwd}
    Comment    检查客户端是否已安装对应软件
    ${softtest}=    runcmd_checkret    dpkg -l | grep hello    hello
    log    ${softtest}
    Run Keyword Unless  ${softtest}    install_soft_forclient    hello    autotest    hello    219652
    sleep    10
    runcmd   hello
    sleep    5
    runcmd    sudo systemctl restart dmcg
    sleep    30
    Check_Software_Usagerecord_Inpersonnel    hello    auto01
    Close All Browsers


235086-【回归测试】web二级管理员--区域中心-区内软件移除
    ${cmsweb}=    get single option value    common    cmsweb
    ${browser}=    get single option value    common    browser
    ${login_user}=    get single option value   secondaryadministrator    webadmin01
    ${login_passwd}=    get single option value    secondaryadministrator    webpasswd01
    ${cmdline_software}=   get single option value    cmdline    checksoft
    ${softname}=    get single option value    software    softname03
    ${areaname}=    get single option value    area    areaname
    ${sofedeb}=  get single option value    software    softtest02
    ${softdesktop}=    get single option value    software    softdesktop2
    login_cms    ${cmsweb}    ${login_user}    ${login_passwd}
    ${softstatus}=    Check_Software_Ismarkd    ${softname}
    Comment    Get software（deepin-music) marked status
    Run Keyword Unless    ${softstatus}    Marksoftware_Byid    ${sofedeb}    应用软件   ${softname}    215937
    check_software    ${softname}
    Comment     Check software installed or not on client
    ${softinsall}=     runcmd_checkret    ${cmdline_software}    ${softdesktop}
    Comment    Need to be installed if software is not installed
    Run Keyword Unless    ${softinsall}    enter_area    ${areaname}
    Run Keyword Unless    ${softinsall}    add_soft_in_area    ${softname}
    Comment   Software should be installed on client
    Wait Until Keyword Succeeds    2 min    10 sec    runcmd_true    ${cmdline_software}    ${softdesktop}
    Comment    Remove software from area software installed list
    enter_area    ${areaname}
    do_softop_inarea_single    ${softname}    RM
    Comment   Software should be uninstalled on client
    Wait Until Keyword Succeeds    2 min    10 sec    runcmd_false    ${cmdline_software}    ${softdesktop}
    Close All Browsers


235087-【回归测试】web二级管理员--软件中心移除软件标注
    ${cmsweb}=    get single option value    common    cmsweb
    ${browser}=    get single option value    common    browser
    ${login_user}=    get single option value   secondaryadministrator    webadmin01
    ${login_passwd}=    get single option value    secondaryadministrator    webpasswd01
    ${cmdline_software}=   get single option value    cmdline    checksoft
    ${softname}=    get single option value    software    softname03
    ${areaname}=    get single option value    area    areaname
    ${sofedeb}=  get single option value    software    softtest02
    ${softdesktop}=    get single option value    software    softdesktop2
    login_cms    ${cmsweb}    ${login_user}    ${login_passwd}
    ${softstatus}=    Check_Software_Ismarkd    ${softname}
    Comment    Get software（deepin-music) marked status
    Run Keyword Unless    ${softstatus}    Marksoftware_Byid    ${sofedeb}    应用软件   ${softname}    215937
    check_software    ${softname}
    Comment     Check software installed or not on client
    ${softinsall}=     runcmd_checkret    ${cmdline_software}    ${softdesktop}
    Comment    Need to be installed if software is not installed
    Run Keyword Unless    ${softinsall}    enter_area    ${areaname}
    Run Keyword Unless    ${softinsall}    add_soft_in_area    ${softname}
    Comment   Software should be installed on client
    Wait Until Keyword Succeeds    2 min    10 sec    runcmd_true    ${cmdline_software}    ${softdesktop}
    Comment    Remove software from softwarecenter  markd list
    softcenter_op    ${softname}    RM
    Comment   Software should be uninstalled on client
    Wait Until Keyword Succeeds    2 min    10 sec    runcmd_false    ${cmdline_software}    ${softdesktop}
    Close All Browsers

235082-【回归测试】web二级管理员--区域中心，终端默认配置修改
    ${cmsweb}=    Get Single Option Value    common    cmsweb
    ${browser}=    Get Single Option Value    common    browser
    ${login_user}=    Get Single Option Value   secondaryadministrator    webadmin01
    ${login_passwd}=    Get Single Option Value    secondaryadministrator    webpasswd01
    ${loginit}=    Get Single Option Value    cmdline    loginit
    ${cmdline}=    Get Single Option Value    cmdline    imagepath
    ${areaname}=    Get Single Option Value    area   areaname
    ${filepath}=    Get Single Option Value    file    picpath
    Comment    log init
    Run Cmd    ${loginit}
    Sleep    3
    Login Cms   ${cmsweb}    ${login_user}    ${login_passwd}
    Set Basicset Wallpaper   ${areaname}    ${filepath}
    Wait Until Keyword Succeeds    2 min    10 sec    Run Cmd_true    ${cmdline}     api
    ${ret}=     Run Cmd Index    ${cmdline}    ${0}
    log    ${ret}
    ${css}=    Join Str    None    css:    img[src='    ${ret}    ']
    Page Should Contain Element    ${css}
    Close All Browsers