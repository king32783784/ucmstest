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
235060-【回归测试】超级管理员--LADP普通用户终端详情已装软件列表
    ${cmsweb}=    get single option value    common    cmsweb
    ${browser}=    get single option value    common    browser
    ${login_user}=    get single option value    common    adminuser
    ${login_passwd}=    get single option value    common    adminpasswd
    login_cms    ${cmsweb}    ${login_user}    ${login_passwd}
    ${softstatus}=    Check_Software_Ismarkd    music
    Run Keyword Unless    ${softstatus}    Marksoftware_Byid    deepin-music    应用软件   music    215939
    check_software    music
    enter_area    autotest
    add_soft_in_area    music
    ${cmdline}    set variable    ls /home/*/Desktop/ | grep deepin-music.desktop
    Wait Until Keyword Succeeds    2 min    10 sec     runcmd should be contain    ${cmdline}    deepin-music
    Checksoft_Client    music    test-PC
    Close All Browsers

235064-【回归测试】超级管理员--LADP普通用户人员详情软件使用记录
    ${cmsweb}=    get single option value    common    cmsweb
    ${browser}=    get single option value    common    browser
    ${login_user}=    get single option value    common    adminuser
    ${login_passwd}=    get single option value    common    adminpasswd
    login_cms    ${cmsweb}    ${login_user}    ${login_passwd}
    ${softtest}=    runcmd_checkret    dpkg -l | grep hello    hello
    log    ${softtest}
    Run Keyword Unless  ${softtest}    install_soft_forclient    hello    autotest    hello    219652
    sleep    10
    runcmd   hello
    sleep    5
    runcmd    sudo systemctl restart dmcg
    Wait Until Keyword Succeeds    2 min    10 sec    Check_Software_Usagerecord_Inpersonnel    hello    auto01
    Close All Browsers


235006-【回归测试】超级管理员--已登录的LADP用户下发平台消息
    ${cmsweb}=    get single option value    common    cmsweb
    ${browser}=    get single option value    common    browser
    ${login_user}=    get single option value    common    adminuser
    ${login_passwd}=    get single option value    common    adminpasswd
    ${username}=   get single option value    user    username01
    ${checkcmd}=    get single option value    cmdline    sendmsglog
    login_cms    ${cmsweb}    ${login_user}    ${login_passwd}
    ${msgtitle}=    makeroundstr    ${20}
    task_sendmessage_user     ${username}    ${msgtitle}
    Wait Until Keyword Succeeds    2 min    10 sec    runcmd_checkret    ${checkcmd}    ${msgtitle}
    Close All Browsers


235141-【回归测试】web二级管理员--LADP普通用户终端详情已装软件列表
    ${cmsweb}=    get single option value    common    cmsweb
    ${browser}=    get single option value    common    browser
    ${login_user_secondary}=    get single option value   secondaryadministrator    webadmin01
    ${login_passwd_secondary}=    get single option value    secondaryadministrator    webpasswd01
    ${login_user}=    get single option value    common    adminuser
    ${login_passwd}=    get single option value    common    adminpasswd
    login_cms    ${cmsweb}    ${login_user}    ${login_passwd}
    Add_Webadmin     超级管理员 (admin)     ${login_user_secondary}
    login_cms    ${cmsweb}    ${login_user}    ${login_passwd}
    ${softstatus}=    Check_Software_Ismarkd    movie
    Comment    判断deepin-movie的状态，确定是否标记
    Run Keyword Unless    ${softstatus}    Marksoftware_Byid    deepin-movie    应用软件   movie   215937
    check_software    movie
    Comment    进入autotest区域
    enter_area    autotest
    Comment     添加movie软件
    add_soft_in_area    movie
    Comment    判断是否生成了桌面快捷方式，后续优化为定时检查
    ${cmdline}    set variable    ls /home/*/Desktop/ | grep deepin-movie.desktop
    Wait Until Keyword Succeeds    2 min    10 sec    runcmd should be contain    ${cmdline}    deepin-movie
    Comment    检查终端详情对应软件安装记录是否存在
    Checksoft_Client    movie    test-PC
    Close All Browsers


235145-【回归测试】web二级管理员--LADP普通用户人员详情软件使用记录
    ${cmsweb}=    get single option value    common    cmsweb
    ${browser}=    get single option value    common    browser
    ${login_user}=    get single option value   secondaryadministrator    webadmin01
    ${login_passwd}=    get single option value    secondaryadministrator    webpasswd01
    ${ptuser}=     get single option value    user    userpt
    login_cms    ${cmsweb}    ${login_user}    ${login_passwd}
    Comment    检查客户端是否已安装对应软件
    ${softtest}=    runcmd_checkret    dpkg -l | grep hello    hello
    log    ${softtest}
    Run Keyword Unless  ${softtest}    install_soft_forclient    hello    autotest    hello    219652
    sleep    10
    runcmd   hello
    sleep    5
    runcmd    sudo systemctl restart dmcg
    Wait Until Keyword Succeeds    2 min    10 sec    Check_Software_Usagerecord_Inpersonnel    hello     ${ptuser}
    Close All Browsers


235088-【回归测试】web二级管理员--已登录的LADP用户下发平台消息
    ${cmsweb}=    get single option value    common    cmsweb
    ${browser}=    get single option value    common    browser
    ${login_user}=    get single option value   secondaryadministrator    webadmin01
    ${login_passwd}=    get single option value    secondaryadministrator    webpasswd01
    ${username}=   get single option value    user    username01
    ${checkcmd}=    get single option value    cmdline    sendmsglog
    login_cms    ${cmsweb}    ${login_user}    ${login_passwd}
    ${msgtitle}=    makeroundstr    ${20}
    task_sendmessage_user     ${username}    ${msgtitle}
    Wait Until Keyword Succeeds    2 min    10 sec    runcmd_checkret    ${checkcmd}    ${msgtitle}
    Close All Browsers


245981-【控制中心帐户入口管控策略优化】加入管控后,LDAP普通用户控制中心--账户入口隐藏
    start_control
    screen_should_notcontainpic    control_zhanghu.png
    clickbypic    control_close.png