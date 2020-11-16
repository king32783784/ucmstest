*** Settings ***
Library           SeleniumLibrary
Library           MultiClient
Library           CmsBase
Resource          lib/base.robot
Resource          lib/softcenter.robot
Resource          lib/area.robot
Resource          lib/task.robot


*** Test Cases ***
235136-【回归测试】web二级管理员--终端详情页下发系统更新任务
    ${cmsweb}=    Get Single Option Value    common    cmsweb
    ${browser}=    Get Single Option Value    common    browser
    ${admin_user}=    Get Single Option Value   common    adminuser
    ${admin_passwd}=    Get Single Option Value   common    adminpasswd
    ${login_user}=    Get Single Option Value   secondaryadministrator    webadmin01
    ${login_passwd}=    Get Single Option Value    secondaryadministrator    webpasswd01
    ${clientname}=    Get Single Option Value    client    clientname
    ${loginit}=    Get Single Option Value    cmdline    loginit
    ${updatecheckcmd}=    Get Single Option Value    cmdline   sysupdatelog
    Run Cmd    ${loginit}
    Comment    终端中心详情页下发系统更新任务
    Login Cms   ${cmsweb}    ${login_user}    ${login_passwd}
    Comment    终端中心详情页下发系统更新任务
    Clientcenter Details Op    ${clientname}
    Wait Until Keyword Succeeds    1 min    10 sec    Run Cmd Should Be Contain   ${updatecheckcmd}    apt-get
    Close All Browsers

235131-【回归测试】web二级管理员--区域详情仪表盘下发系统更新任务
    ${cmsweb}=    Get Single Option Value    common    cmsweb
    ${browser}=    Get Single Option Value    common    browser
    ${login_user}=    Get Single Option Value   secondaryadministrator    webadmin01
    ${login_passwd}=    Get Single Option Value    secondaryadministrator    webpasswd01
    ${clientname}=    Get Single Option Value    client    clientname
    ${loginit}=    Get Single Option Value    cmdline    loginit
    ${updatecheckcmd}=   Get Single Option Value    cmdline   sysupdatelog
    Run Cmd    ${loginit}
    Login Cms   ${cmsweb}    ${login_user}    ${login_passwd}
    Comment    进入autotest区域
    Enter Area    autotest
    Comment    区域内仪表盘下发系统更新任务
    Do Systemupdate Inarea By Dashboard
    Wait Until Keyword Succeeds    1 min    10 sec    Run Cmd Should Be Contain   ${updatecheckcmd}    apt-get
    Close All Browsers

235132-【回归测试】web二级管理员--区域详情下发系统更新任务
    ${cmsweb}=    Get Single Option Value    common    cmsweb
    ${browser}=    Get Single Option Value    common    browser
    ${login_user}=    Get Single Option Value   secondaryadministrator    webadmin01
    ${login_passwd}=    Get Single Option Value    secondaryadministrator    webpasswd01
    ${clientname}=    Get Single Option Value    client    clientname
    ${loginit}=    Get Single Option Value    cmdline    loginit
    ${updatecheckcmd}=    Get Single Option Value    cmdline   sysupdatelog
    Run Cmd    ${loginit}
    Login Cms   ${cmsweb}    ${login_user}    ${login_passwd}
    Comment    进入autotest区域
    Enter Area    autotest
    Comment    区域详情-区内终端-系统更新
    Do Systemupdate Inarea Byclient    test-PC
    Wait Until Keyword Succeeds    1 min    10 sec    Run Cmd Should Be Contain   ${updatecheckcmd}    apt-get
    Close All Browsers

235138-【回归测试】web二级管理员--任务管理根据终端下发系统更新任务
    ${cmsweb}=    Get Single Option Value    common    cmsweb
    ${browser}=    Get Single Option Value    common    browser
    ${login_user}=    Get Single Option Value    secondaryadministrator    webadmin01
    ${login_passwd}=    Get Single Option Value    secondaryadministrator    webpasswd01
    ${client_name}=    Get Single Option Value    client   clientname
    ${updatecheckcmd}=    Get Single Option Value    cmdline   sysupdatelog
    ${loginit}=    Get Single Option Value    cmdline    loginit
    Run Cmd    ${loginit}
    Login Cms   ${cmsweb}    ${login_user}    ${login_passwd}
    Do Task Sys Byclient    ${client_name}
    Wait Until Keyword Succeeds    1 min    10 sec    Run Cmd Should Be Contain   ${updatecheckcmd}    apt-get
    Close All Browsers

235137-【回归测试】web二级管理员--任务管理根据区域下发系统更新任务
    ${cmsweb}=    Get Single Option Value    common    cmsweb
    ${browser}=    Get Single Option Value    common    browser
    ${login_user}=    Get Single Option Value    common    adminuser
    ${login_passwd}=    Get Single Option Value    common    adminpasswd
    ${loginit}=    Get Single Option Value    cmdline    loginit
    ${updatecheckcmd}=    Get Single Option Value    cmdline   sysupdatelog
    ${areaname}=    Get Single Option Value    area    areaname
    Run Cmd    ${loginit}
    Login Cms   ${cmsweb}    ${login_user}    ${login_passwd}
    Do Task Now Byarea    system    ${areaname}
    Wait Until Keyword Succeeds    1 min    10 sec    Run Cmd Should Be Contain   ${updatecheckcmd}    apt-get
    Close All Browsers

235134-【回归测试】web二级管理员--终端中心单个终端下发系统更新任务
    ${cmsweb}=    Get Single Option Value    common    cmsweb
    ${browser}=    Get Single Option Value    common    browser
    ${login_user}=    Get Single Option Value    secondaryadministrator    webadmin01
    ${login_passwd}=    Get Single Option Value    secondaryadministrator    webpasswd01
    ${clientname}=    Get Single Option Value    client    clientname
    ${loginit}=    Get Single Option Value    cmdline    loginit
    ${updatecheckcmd}=    Get Single Option Value    cmdline   sysupdatelog
    Run Cmd    ${loginit}
    Login Cms   ${cmsweb}    ${login_user}    ${login_passwd}
    Do Task From Client Center    ${clientname}
    Wait Until Keyword Succeeds    1 min    10 sec    Run Cmd Should Be Contain   ${updatecheckcmd}    apt-get
    Close All Browsers

235130【回归测试】web二级管理员--任务管理根据软件更新
    ${cmsweb}=    Get Single Option Value    common    cmsweb
    ${browser}=    Get Single Option Value    common    browser
    ${login_user}=    Get Single Option Value   secondaryadministrator    webadmin01
    ${login_passwd}=    Get Single Option Value    secondaryadministrator    webpasswd01
    ${softname_alias}=     Get Single Option Value    software    movie_alias
    ${softname_deb}=    Get Single Option Value    software    movie_debname
    ${softname_id}=    Get Single Option Value    software    movie_id_amd
    ${cmd_softinstcheck}=    Get Single Option Value    cmdline    softinst_status_movie
    ${cmdline}=    Get Single Option Value    cmdline    softupdatelog
    ${loginit}=    Get Single Option Value    cmdline    loginit
    ${areaname}=    Get Single Option Value    area    areaname
    Run Cmd    ${loginit}
    ${softstatus}=    Run Cmd Checkret   ${cmd_softinstcheck}    deepin-movie
    Login Cms    ${cmsweb}    ${login_user}    ${login_passwd}
    Run Keyword If    '${softstatus}' == 'False'    Install Soft For Client    ${softname_deb}    ${areaname}    ${softname_alias}    ${softname_id}
    Do Task Soft Bysoft    NOW    SOFT    ${softname_alias}
    Wait Until Keyword Succeeds    1 min    10 sec    Run CmdShould Be Contain    ${cmdline}    dpkg-query
    Close All Browsers

235129【回归测试】web二级管理员--任务管理根据区域更新软件
    ${cmsweb}=    Get Single Option Value    common    cmsweb
    ${browser}=    Get Single Option Value    common    browser
    ${login_user}=    Get Single Option Value   secondaryadministrator    webadmin01
    ${login_passwd}=    Get Single Option Value    secondaryadministrator    webpasswd01
    ${softname_alias}=     Get Single Option Value    software    movie_alias
    ${softname_deb}=    Get Single Option Value    software    movie_debname
    ${softname_id}=    Get Single Option Value    software    movie_id_amd
    ${cmd_softinstcheck}=    Get Single Option Value    cmdline    softinst_status_movie
    ${cmdline}=    Get Single Option Value    cmdline    softupdatelog
    ${loginit}=    Get Single Option Value    cmdline    loginit
    ${areaname}=    Get Single Option Value    area    areaname
    Run Cmd    ${loginit}
    ${softstatus}=    Run Cmd Checkret   ${cmd_softinstcheck}    deepin-movie
    Login Cms    ${cmsweb}    ${login_user}    ${login_passwd}
    Run Keyword If    '${softstatus}' == 'False'    Install Soft For Client    ${softname_deb}    ${areaname}    ${softname_alias}    ${softname_id}
    Do Task Soft Bysoft   NOW    AREA    ALL    ${areaname}
    Wait Until Keyword Succeeds    1 min    10 sec    Run CmdShould Be Contain    ${cmdline}    dpkg-query
    Close All Browsers

235127【回归测试】web二级管理员--在软件中心单个更新软件
    ${cmsweb}=    Get Single Option Value    common    cmsweb
    ${browser}=    Get Single Option Value    common    browser
    ${login_user}=    Get Single Option Value   secondaryadministrator    webadmin01
    ${login_passwd}=    Get Single Option Value    secondaryadministrator    webpasswd01
    ${softname_alias}=     Get Single Option Value    software    movie_alias
    ${softname_deb}=    Get Single Option Value    software    movie_debname
    ${softname_id}=    Get Single Option Value    software    movie_id_amd
    ${cmd_softinstcheck}=    Get Single Option Value    cmdline    softinst_status_movie
    ${cmdline}=    Get Single Option Value    cmdline    softupdatelog
    ${loginit}=    Get Single Option Value    cmdline    loginit
    ${areaname}=    Get Single Option Value    area    areaname
    Run Cmd    ${loginit}
    ${softstatus}=    Run Cmd Checkret   ${cmd_softinstcheck}   deepin-movie
    Login Cms    ${cmsweb}    ${login_user}    ${login_passwd}
    Run Keyword If    '${softstatus}' == 'False'    Install Soft For Client    ${softname_deb}    ${areaname}    ${softname_alias}    ${softname_id}
    Softcenter Op    ${softname_alias}    UP
    Wait Until Keyword Succeeds    3 min    10 sec    Run CmdShould Be Contain    ${cmdline}    dpkg-query
    Close All Browsers

235125【回归测试】web二级管理员--在终端中心单个终端更新软件
    ${cmsweb}=    Get Single Option Value    common    cmsweb
    ${browser}=    Get Single Option Value    common    browser
    ${login_user}=    Get Single Option Value   secondaryadministrator    webadmin01
    ${login_passwd}=    Get Single Option Value    secondaryadministrator    webpasswd01
    ${softname_alias}=     Get Single Option Value    software    movie_alias
    ${softname_deb}=    Get Single Option Value    software    movie_debname
    ${softname_id}=    Get Single Option Value    software    movie_id_amd
    ${cmd_softinstcheck}=    Get Single Option Value    cmdline    softinst_status_movie
    ${cmdline}=    Get Single Option Value    cmdline    softupdatelog
    ${loginit}=    Get Single Option Value    cmdline    loginit
    ${areaname}=    Get Single Option Value    area    areaname
    ${clientname}=   Get Single Option Value    client    clientname
    Run Cmd    ${loginit}
    ${softstatus}=    Run Cmd Checkret   ${cmd_softinstcheck}   deepin-movie
    Login Cms    ${cmsweb}    ${login_user}    ${login_passwd}
    Run Keyword If    '${softstatus}' == 'False'    Install Soft For Client    ${softname_deb}    ${areaname}    ${softname_alias}    ${softname_id}
    Do Task From Client Center    ${clientname}    Soft
    Wait Until Keyword Succeeds    3 min    10 sec    Run CmdShould Be Contain    ${cmdline}    dpkg-query
    Close All Browsers

235123【回归测试】web二级管理员--在区域中心更新软件
    ${cmsweb}=    Get Single Option Value    common    cmsweb
    ${browser}=    Get Single Option Value    common    browser
    ${login_user}=    Get Single Option Value   secondaryadministrator    webadmin01
    ${login_passwd}=    Get Single Option Value    secondaryadministrator    webpasswd01
    ${softname_alias}=     Get Single Option Value    software    movie_alias
    ${softname_deb}=    Get Single Option Value    software    movie_debname
    ${softname_id}=    Get Single Option Value    software    movie_id_amd
    ${cmd_softinstcheck}=    Get Single Option Value    cmdline    softinst_status_movie
    ${cmdline}=    Get Single Option Value    cmdline    softupdatelog
    ${loginit}=    Get Single Option Value    cmdline    loginit
    ${areaname}=    Get Single Option Value    area    areaname
    Run Cmd    ${loginit}
    ${softstatus}=    Run Cmd Checkret   ${cmd_softinstcheck}   deepin-movie
    Login Cms    ${cmsweb}    ${login_user}    ${login_passwd}
    Run Keyword If    '${softstatus}' == 'False'    Install Soft For Client    ${softname_deb}    ${areaname}    ${softname_alias}    ${softname_id}
    Enter Area    autotest
    Do Softop Inarea Single    ${softname_alias}    UP
    Wait Until Keyword Succeeds    3 min    10 sec    Run CmdShould Be Contain    ${cmdline}    dpkg-query
    Close All Browsers

235128【回归测试】web二级管理员--在软件中心批量更新软件
    ${cmsweb}=    Get Single Option Value    common    cmsweb
    ${browser}=    Get Single Option Value    common    browser
    ${login_user}=    Get Single Option Value   secondaryadministrator    webadmin01
    ${login_passwd}=    Get Single Option Value    secondaryadministrator    webpasswd01
    ${softname_alias}=     Get Single Option Value    software    movie_alias
    ${softname_deb}=    Get Single Option Value    software    movie_debname
    ${softname_id}=    Get Single Option Value    software    movie_id_amd
    ${softname_alias1}=     Get Single Option Value    software    music_alias
    ${softname_deb1}=    Get Single Option Value    software    music_debname
    ${softname_id1}=    Get Single Option Value    software    music_id_amd
    ${cmd_softinstcheck}=    Get Single Option Value    cmdline    softinst_status_movie
    ${cmd_softinstcheck1}=    Get Single Option Value    cmdline    softinst_status_music
    ${cmdline}=    Get Single Option Value    cmdline    softupdatelog
    ${loginit}=    Get Single Option Value    cmdline    loginit
    ${areaname}=    Get Single Option Value    area    areaname
    Run Cmd    ${loginit}
    ${softstatus}=    Run Cmd Checkret   ${cmd_softinstcheck}    deepin-movie
    ${softstatus1}=    Run Cmd Checkret   ${cmd_softinstcheck1}    deepin-music
    Login Cms    ${cmsweb}    ${login_user}    ${login_passwd}
    Run Keyword If    '${softstatus}' == 'False'    Install Soft For Client    ${softname_deb}    ${areaname}    ${softname_alias}    ${softname_id}
    Run Keyword If    '${softstatus1}' == 'False'    Install Soft For Client    ${softname_deb1}    ${areaname}    ${softname_alias1}    ${softname_id1}
    ${softlist}=    Create List    ${softname_alias}    ${softname_alias1}
    Do Task From Soft Center    ${softlist}
    Wait Until Keyword Succeeds    3 min    10 sec    Run CmdShould Be Contain    ${cmdline}    dpkg-query
    Close All Browsers

235124【回归测试】web二级管理员--在区域中心批量更新软件
    ${cmsweb}=    Get Single Option Value    common    cmsweb
    ${browser}=    Get Single Option Value    common    browser
    ${login_user}=    Get Single Option Value   secondaryadministrator    webadmin01
    ${login_passwd}=    Get Single Option Value    secondaryadministrator    webpasswd01
    ${softname_alias}=     Get Single Option Value    software    movie_alias
    ${softname_deb}=    Get Single Option Value    software    movie_debname
    ${softname_id}=    Get Single Option Value    software    movie_id_amd
    ${softname_alias1}=     Get Single Option Value    software    music_alias
    ${softname_deb1}=    Get Single Option Value    software    music_debname
    ${softname_id1}=    Get Single Option Value    software    music_id_amd
    ${cmd_softinstcheck}=    Get Single Option Value    cmdline    softinst_status_movie
    ${cmd_softinstcheck1}=    Get Single Option Value    cmdline    softinst_status_music
    ${cmdline}=    Get Single Option Value    cmdline    softupdatelog
    ${loginit}=    Get Single Option Value    cmdline    loginit
    ${areaname}=    Get Single Option Value    area    areaname
    Run Cmd    ${loginit}
    ${softstatus}=    Run Cmd Checkret   ${cmd_softinstcheck}    deepin-movie
    ${softstatus1}=    Run Cmd Checkret   ${cmd_softinstcheck1}    deepin-music
    Login Cms    ${cmsweb}    ${login_user}    ${login_passwd}
    Run Keyword If    '${softstatus}' == 'False'    Install Soft For Client    ${softname_deb}    ${areaname}    ${softname_alias}    ${softname_id}
    Run Keyword If    '${softstatus1}' == 'False'    Install Soft For Client    ${softname_deb1}    ${areaname}    ${softname_alias1}    ${softname_id1}
    ${softlist}=    Create List    ${softname_alias}    ${softname_alias1}
    Enter Area    ${areaname}
    Do Softop Inarea Batch    ${softlist}    UP
    Wait Until Keyword Succeeds    3 min    10 sec    Run CmdShould Be Contain    ${cmdline}    dpkg-query
    Close All Browsers



