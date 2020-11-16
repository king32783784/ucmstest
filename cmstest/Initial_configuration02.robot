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
124462-【初始化配置】完成配置界面--配置过程中点击加入管控按钮前管理员账号被区内冻结
    ${cmsip}=    get single option value    common    cmsip
    ${cmsport}=    get single option value    common    cmsport
    ${username}=     get single option value    user    username01
    ${cmsweb}=    get single option value    common    cmsweb
    ${browser}=    get single option value    common    browser
    ${login_user}=    get single option value    common    adminuser
    ${login_passwd}=    get single option value    common    adminpasswd
    ${areaname}=    get single option value    area    areaname
    init_dmcw
    start_dmcw
    sleep    3
    inputbypic    server_address_input.png    200   0    ${cmsip}
    sleep    1
    inputbypic    server_port_input.png    200   0    ${cmsport}
    sleep    1
    clickbypic    next.png
    sleep    1
    clickbypic    area_autotest.png
    clickbypic    next.png
    sleep    2
    Comment     locking user
    login_cms    ${cmsweb}    ${login_user}    ${login_passwd}
    do_userop_inarea_single    ${areaname}    ${username}    LOCK
    inputbypic    area_win_input.png    0   -50    ${username}
    inputbypic    area_win_input.png    -100   0    abcd1234
    clickbypic    next.png
    sleep    3
    screencontainpic    account_is_frozen.png
    clickbypic    queding.png
    clickbypic     x_gray.png
    Comment    active user
    do_userop_inarea_single    ${areaname}    ${username}    ACTIVE
    Close All Browsers


124461【初始化配置】完成配置界面--配置过程中点击加入管控按钮前管理员账号被人员详情界面冻结
    ${cmsip}=    get single option value    common    cmsip
    ${cmsport}=    get single option value    common    cmsport
    ${username}=     get single option value    user    username01
    ${cmsweb}=    get single option value    common    cmsweb
    ${browser}=    get single option value    common    browser
    ${login_user}=    get single option value    common    adminuser
    ${login_passwd}=    get single option value    common    adminpasswd
    ${areaname}=    get single option value    area    areaname
    init_dmcw
    start_dmcw
    sleep    3
    inputbypic    server_address_input.png    200   0    ${cmsip}
    sleep    1
    inputbypic    server_port_input.png    200   0    ${cmsport}
    sleep    1
    clickbypic    next.png
    sleep    1
    clickbypic    area_autotest.png
    clickbypic    next.png
    sleep    2
    Comment     locking user
    login_cms    ${cmsweb}    ${login_user}    ${login_passwd}
    Do_Op_Inpersonnel    ${username}    STOP
    inputbypic    area_win_input.png    0   -50    ${username}
    inputbypic    area_win_input.png    -100   0    abcd1234
    clickbypic    next.png
    sleep    3
    screencontainpic    account_is_frozen.png
    clickbypic    queding.png
    clickbypic     x_gray.png
    Comment    active user
    Do_Op_Inpersonnel    ${username}    START
    Close All Browsers


124463-【初始化配置】完成配置界面--配置过程中点击加入管控按钮前管理员账号被区内移除
    ${cmsip}=    get single option value    common    cmsip
    ${cmsport}=    get single option value    common    cmsport
    ${username}=     get single option value    user    username01
    ${cmsweb}=    get single option value    common    cmsweb
    ${browser}=    get single option value    common    browser
    ${login_user}=    get single option value    common    adminuser
    ${login_passwd}=    get single option value    common    adminpasswd
    ${areaname}=    get single option value    area    areaname
    init_dmcw
    login_cms    ${cmsweb}    ${login_user}    ${login_passwd}
    Do_add_ladpuser    GL    auto02
    do_adduser_to_area    ${areaname}   auto02
    start_dmcw
    sleep    5
    inputbypic    server_address_input.png    200   0    ${cmsip}
    sleep    1
    inputbypic    server_port_input.png    200   0    ${cmsport}
    sleep    1
    clickbypic    next.png
    sleep    3
    clickbypic    area_autotest.png
    sleep    1
    clickbypic    next.png
    sleep    2
    Comment     Remove user from area
    do_userop_inarea_single    ${areaname}    auto02    RM
    inputbypic    area_win_input.png    0   -50    auto02
    inputbypic    area_win_input.png    -100   0    abcd1234
    clickbypic    next.png
    sleep    3
    screencontainpic    account_wuquanxian.png
    clickbypic    queding.png
    clickbypic     x_gray.png
    Close All Browsers


124460-【初始化配置】完成配置界面--配置过程中点击加入管控按钮前管理员账号被删除
    ${cmsip}=    get single option value    common    cmsip
    ${cmsport}=    get single option value    common    cmsport
    ${username}=     get single option value    user    username01
    ${cmsweb}=    get single option value    common    cmsweb
    ${browser}=    get single option value    common    browser
    ${login_user}=    get single option value    common    adminuser
    ${login_passwd}=    get single option value    common    adminpasswd
    ${areaname}=    get single option value    area    areaname
    init_dmcw
    login_cms    ${cmsweb}    ${login_user}    ${login_passwd}
    Do_add_ladpuser    GL    auto03
    do_adduser_to_area    ${areaname}   auto03
    start_dmcw
    sleep    5
    inputbypic    server_address_input.png    200   0    ${cmsip}
    sleep    1
    inputbypic    server_port_input.png    200   0    ${cmsport}
    sleep    1
    clickbypic    next.png
    sleep    3
    clickbypic    area_autotest.png
    sleep    1
    clickbypic    next.png
    sleep    2
    Comment     Del user
    Do_Op_Inpersonnel    auto03    DEL
    inputbypic    area_win_input.png    0   -50    auto03
    inputbypic    area_win_input.png    -100   0    abcd1234
    clickbypic    next.png
    sleep    3
    screencontainpic    account_zhanghaobucunzai.png
    clickbypic    queding.png
    clickbypic     x_gray.png
    Close All Browsers


124434-【初始化配置】完成配置界面--区域配置信息校验不通过
    ${cmsip}=    get single option value    common    cmsip
    ${cmsport}=    get single option value    common    cmsport
    ${username}=     get single option value    user    username01
    ${cmsweb}=    get single option value    common    cmsweb
    ${browser}=    get single option value    common    browser
    ${login_user}=    get single option value    common    adminuser
    ${login_passwd}=    get single option value    common    adminpasswd
    ${areaname}=    get single option value    area    areaname
    ${cientname}=    get single option value   client    clientname
    init_dmcw
    login_cms    ${cmsweb}    ${login_user}    ${login_passwd}
    start_dmcw
    sleep    5
    inputbypic    server_address_input.png    200   0    ${cmsip}
    sleep    1
    inputbypic    server_port_input.png    200   0    ${cmsport}
    sleep    1
    clickbypic    next.png
    sleep    3
    clickbypic    area_autotest.png
    sleep    1
    clickbypic    next.png
    sleep    2
    Comment     Del area
    do_del_area    ${areaname}
    inputbypic    area_win_input.png    0   -50    auto03
    inputbypic    area_win_input.png    -100   0    abcd1234
    clickbypic    next.png
    sleep    3
    screencontainpic    account_zhanghaobucunzai.png
    clickbypic    queding.png
    clickbypic     x_gray.png
    add_area    根区域    ${areaname}
    do_adduser_to_area    ${areaname}    ${username}
    Close All Browsers


124429-【初始化配置】完成配置界面--配置失败后查看终端详情区内终端列表
    ${cmsip}=    get single option value    common    cmsip
    ${cmsport}=    get single option value    common    cmsport
    ${username}=     get single option value    user    username01
    ${cmsweb}=    get single option value    common    cmsweb
    ${browser}=    get single option value    common    browser
    ${login_user}=    get single option value    common    adminuser
    ${login_passwd}=    get single option value    common    adminpasswd
    ${areaname}=    get single option value    area    areaname
    ${cientname}=    get single option value   client    clientname
    login_cms    ${cmsweb}    ${login_user}    ${login_passwd}
    check_client_inarea      ${cientname}    ${areaname}    False
    Close All Browsers

