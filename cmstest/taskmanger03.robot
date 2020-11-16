*** Settings ***
Library           SeleniumLibrary
Library           MultiClient
Library           CmsBase
Resource          lib/base.robot
Resource          lib/softcenter.robot
Resource          lib/area.robot
Resource          lib/task.robot

*** Test Cases ***
235014-【回归测试】超级管理员--下发立即执行的脚本下发任务
    ${cmsweb}=    Get Single Option Value    common    cmsweb
    ${browser}=    Get Single Option Value    common    browser
    ${login_user}=    Get Single Option Value    common    adminuser
    ${login_passwd}=    Get Single Option Value    common    adminpasswd
    ${cmdline}=    Get Single Option Value    cmdline    scriptlog
    ${cmdline1}=    Get Single Option Value    cmdline    scripttest
    ${loginit}=    Get Single Option Value    cmdline    loginit
    ${clientname}=    Get Single Option Value    client    clientname
    ${filepath}=    Get Single Option Value    file    scriptpath
    Run Cmd    ${loginit}
    Run Cmd    sudo rm -rf /opt/testscript.txt
    Login Cms    ${cmsweb}    ${login_user}    ${login_passwd}
    Do Task Script    ${filepath}    NOW    Client    ${clientname}
    Wait Until Keyword Succeeds    2 min    10 sec    Run Cmd Should Be Contain    ${cmdline1}    hello
    Close All Browsers


235015-【回归测试】超级管理员--下发定时执行的脚本下发任务
    ${cmsweb}=    Get Single Option Value    common    cmsweb
    ${browser}=    Get Single Option Value    common    browser
    ${login_user}=    Get Single Option Value    common    adminuser
    ${login_passwd}=    Get Single Option Value    common    adminpasswd
    ${cmdline}=    Get Single Option Value    cmdline    scriptlog
    ${cmdline1}=    Get Single Option Value    cmdline    scripttest
    ${clientname}=    Get Single Option Value    client    clientname
    ${filepath}=    Get Single Option Value    file    scriptpath
    ${loginit}=    Get Single Option Value    cmdline    loginit
    Run Cmd    ${loginit}
    Run Cmd    sudo rm -rf /opt/testscript.txt
    Login Cms    ${cmsweb}    ${login_user}    ${login_passwd}
    Do Task Script    ${filepath}    TIME    Client    ${clientname}
    Wait Until Keyword Succeeds    3 min    30 sec     Run Cmd Should Be Contain    ${cmdline1}    hello
    Close All Browsers


235016-【回归测试】超级管理员--下发周期执行的脚本下发任务
    ${cmsweb}=    Get Single Option Value    common    cmsweb
    ${browser}=    Get Single Option Value    common    browser
    ${login_user}=    Get Single Option Value    common    adminuser
    ${login_passwd}=    Get Single Option Value    common    adminpasswd
    ${cmdline}=    Get Single Option Value    cmdline    scriptlog
    ${cmdline1}=    Get Single Option Value    cmdline    scripttest
    ${clientname}=    Get Single Option Value    client    clientname
    ${filepath}=    Get Single Option Value    file    scriptpath
    ${loginit}=    Get Single Option Value    cmdline    loginit
    Run Cmd    ${loginit}
    Run Cmd    sudo rm -rf /opt/testscript.txt
    Login Cms    ${cmsweb}    ${login_user}    ${login_passwd}
    Do Task Script    ${filepath}    WEEK    Client    ${clientname}
    Wait Until Keyword Succeeds    3 min    30 sec    Run Cmd Should Be Contain    ${cmdline1}    hello
    Close All Browsers


235011-【回归测试】超级管理员--下发立即执行的系统更新任务
    ${cmsweb}=    Get Single Option Value    common    cmsweb
    ${browser}=    Get Single Option Value    common    browser
    ${login_user}=    Get Single Option Value    common    adminuser
    ${login_passwd}=    Get Single Option Value    common    adminpasswd
    ${cmdline}=    Get Single Option Value    cmdline    sysupdatelog
    ${clientname}=    Get Single Option Value    client    clientname
    ${loginit}=    Get Single Option Value    cmdline    loginit
    Run Cmd    ${loginit}
    Login Cms    ${cmsweb}    ${login_user}    ${login_passwd}
    Do Task Sys Byclient    ${clientname}   NOW
    Wait Until Keyword Succeeds    2 min    10 sec    Run Cmd Should Be Contain    ${cmdline}    apt-get
    Close All Browsers


235012-【回归测试】超级管理员--下发定时执行的系统更新任务
    ${cmsweb}=    Get Single Option Value    common    cmsweb
    ${browser}=    Get Single Option Value    common    browser
    ${login_user}=    Get Single Option Value    common    adminuser
    ${login_passwd}=    Get Single Option Value    common    adminpasswd
    ${cmdline}=    Get Single Option Value    cmdline    sysupdatelog
    ${clientname}=    Get Single Option Value    client    clientname
    ${loginit}=    Get Single Option Value    cmdline    loginit
    Run Cmd    ${loginit}
    Login Cms    ${cmsweb}    ${login_user}    ${login_passwd}
    Do Task Sys Byclient    ${clientname}   TIME
    Wait Until Keyword Succeeds    3 min    30 sec    Run Cmd Should Be Contain    ${cmdline}    apt-get
    Close All Browsers


235013-【回归测试】超级管理员--下发周期执行的系统更新任务
    ${cmsweb}=    Get Single Option Value    common    cmsweb
    ${browser}=    Get Single Option Value    common    browser
    ${login_user}=    Get Single Option Value    common    adminuser
    ${login_passwd}=    Get Single Option Value    common    adminpasswd
    ${cmdline}=    Get Single Option Value    cmdline    sysupdatelog
    ${clientname}=    Get Single Option Value    client    clientname
    ${loginit}=    Get Single Option Value    cmdline    loginit
    Run Cmd    ${loginit}
    Login Cms    ${cmsweb}    ${login_user}    ${login_passwd}
    Do Task Sys Byclient    ${clientname}   WEEK
    Wait Until Keyword Succeeds    3 min    30 sec     Run Cmd Should Be Contain    ${cmdline}    apt-get
    Close All Browsers


235008-【回归测试】超级管理员--下发立即执行的软件更新任务
    Comment    超级管理员、软件更新任务、deepin-music
    ${cmsweb}=    Get Single Option Value    common    cmsweb
    ${browser}=    Get Single Option Value    common    browser
    ${login_user}=    Get Single Option Value    common    adminuser
    ${login_passwd}=    Get Single Option Value    common    adminpasswd
    ${softname_alias}=     Get Single Option Value    software    hello_alias
    ${softname_deb}=    Get Single Option Value    software    hello_debname
    ${softname_id}=    Get Single Option Value    software    hello_id_amd
    ${cmd_softinstcheck}=    Get Single Option Value    cmdline    softinst_status_hello
    ${cmdline}=    Get Single Option Value    cmdline    softupdatelog
    ${loginit}=    Get Single Option Value    cmdline    loginit
    ${areaname}=    Get Single Option Value    area    areaname
    Run Cmd    ${loginit}
    ${softstatus}=    Run Cmd Checkret   ${cmd_softinstcheck}    hello
    Login Cms    ${cmsweb}    ${login_user}    ${login_passwd}
    Run Keyword If    '${softstatus}' == 'False'    Install Soft For Client    ${softname_deb}    ${areaname}    ${softname_alias}    ${softname_id}
    Do Task Soft Bysoft    NOW   SOFT    ${softname_alias}
    Wait Until Keyword Succeeds    2 min    10 sec    Run Cmd Should Be Contain    ${cmdline}    dpkg-query
    Close All Browsers


235009-【回归测试】超级管理员--下发定时执行的软件更新任务
    ${cmsweb}=    Get Single Option Value    common    cmsweb
    ${browser}=    Get Single Option Value    common    browser
    ${login_user}=    Get Single Option Value    common    adminuser
    ${login_passwd}=    Get Single Option Value    common    adminpasswd
    ${softname_alias}=     Get Single Option Value    software    hello_alias
    ${softname_deb}=    Get Single Option Value    software    hello_debname
    ${softname_id}=    Get Single Option Value    software    hello_id_amd
    ${cmd_softinstcheck}=    Get Single Option Value    cmdline    softinst_status_hello
    ${cmdline}=    Get Single Option Value    cmdline    softupdatelog
    ${loginit}=    Get Single Option Value    cmdline    loginit
    ${areaname}=    Get Single Option Value    area    areaname
    Run Cmd    ${loginit}
    ${softstatus}=    Run Cmd Checkret    ${cmd_softinstcheck}    hello
    Login Cms    ${cmsweb}    ${login_user}    ${login_passwd}
    Run Keyword If    '${softstatus}' == 'False'    Install Soft For Client    ${softname_deb}    ${areaname}    ${softname_alias}   ${softname_id}
    Do Task Soft Bysoft    TIME   SOFT   ${softname_alias}
    Wait Until Keyword Succeeds    3 min    30 sec    Run Cmd Should Be Contain    ${cmdline}    dpkg-query
    Close All Browsers


235010-【回归测试】超级管理员--下发周期执行的软件更新任务
    ${cmsweb}=    Get Single Option Value    common    cmsweb
    ${browser}=    Get Single Option Value    common    browser
    ${login_user}=    Get Single Option Value    common    adminuser
    ${login_passwd}=    Get Single Option Value    common    adminpasswd
    ${softname_alias}=     Get Single Option Value    software    hello_alias
    ${softname_deb}=    Get Single Option Value    software    hello_debname
    ${softname_id}=    Get Single Option Value    software    hello_id_amd
    ${cmd_softinstcheck}=    Get Single Option Value    cmdline    softinst_status_hello
    ${cmdline}=    Get Single Option Value    cmdline    softupdatelog
    ${loginit}=    Get Single Option Value    cmdline    loginit
    ${areaname}=    Get Single Option Value    area    areaname
    Run Cmd    ${loginit}
    ${softstatus}=    Run Cmd Checkret   ${cmd_softinstcheck}    hello
    Login Cms    ${cmsweb}    ${login_user}    ${login_passwd}
    Run Keyword If    '${softstatus}' == 'False'    Install Soft For Client    ${softname_deb}    ${areaname}    ${softname_alias}    ${softname_id}
    Do Task Soft Bysoft    WEEK   SOFT    ${softname_alias}
    Wait Until Keyword Succeeds    3 min    30 sec    Run Cmd Should Be Contain    ${cmdline}    dpkg-query
    Close All Browsers