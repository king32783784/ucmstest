*** Settings ***
Library           SeleniumLibrary
Library           MultiClient
Resource          lib/base.robot
Resource          lib/softcenter.robot
Library           CmsBase
Resource          lib/area.robot
Resource          lib/dmcwui.robot
Resource          lib/usercenter.robot
Resource          lib/clientcenter.robot


*** Test Cases ***
124353-【初始化配置】配置后台服务器IP和端口号--正确的IP地址格式校验
    ${cmsip}=    Get Single Option Value    common    cmsip
    ${cmsport}=    Get Single Option Value    common    cmsport
    Init Dmcw
    Start Dmcw
    Sleep    3
    Input By Pic    server_address_input.png    200   0    ${cmsip}
    Input By Pic    server_port_input.png    200   0    ${cmsport}
    Click By Pic    next.png
    Screen Should Contain Pic    suoshuquyuxuanze.png
    Click By Pic     x_gray.png


124355-【初始化配置】配置后台服务器IP和端口号--端口号输入正确的数字
    ${cmsip}=    Get Single Option Value    common    cmsip
    ${cmsport}=    Get Single Option Value    common    cmsport
    Init Dmcw
    Start Dmcw
    Sleep    3
    Input By Pic    server_address_input.png    200   0    ${cmsip}
    Input By Pic    server_port_input.png    200   0    ${cmsport}
    Click By Pic    next.png
    Screen Should Contain Pic    suoxuanquyuxuanze.png


124359-【初始化配置】配置后台服务器IP和端口号--IP地址为空
    ${cmsip}=    Get Single Option Value    common    cmsip
    ${cmsport}=    Get Single Option Value    common    cmsport
    Init Dmcw
    Start Dmcw
    Sleep    3
    Input By Pic    server_port_input.png    200   0    ${cmsport}
    Click By Pic    next.png
    Sleep    3
    Screen Should Not Contain Pic    suoxuanquyuxuanze.png
    Click By Pic     x_gray.png


124358-【初始化配置】配置后台服务器IP和端口号--端口号为空时
    ${cmsip}=    Get Single Option Value    common    cmsip
    ${cmsport}=    Get Single Option Value    common    cmsport
    Init Dmcw
    Start Dmcw
    Sleep    3
    Input By Pic    server_address_input.png    200   0    ${cmsip}
    Click By Pic    next.png
    Sleep    3
    Screen Should Not Contain Pic    suoxuanquyuxuanze.png
    Click By Pic     x_gray.png


124371-【初始化配置】选择终端所属区域--未选择区域时，所选区域展示
    ${cmsip}=    Get Single Option Value    common    cmsip
    ${cmsport}=    Get Single Option Value    common    cmsport
    Init Dmcw
    Start Dmcw
    Sleep    3
    Input By Pic    server_address_input.png    200   0    ${cmsip}
    Input By Pic    server_port_input.png    200   0    ${cmsport}
    Click By Pic    next.png
    Sleep    3
    Screen Should Contain Pic    suoxuanquyu_weixuan.png
    Click By Pic     x_gray.png


124382-【初始化配置】选择终端所属区域--本地管理员校验
    ${cmsip}=    Get Single Option Value    common    cmsip
    ${cmsport}=    Get Single Option Value    common    cmsport
    ${localusr}=    Get Single Option Value    user    localuser
    ${localpasswd}=    Get Single Option Value    user    localpasswd
    Init Dmcw
    Start Dmcw
    Sleep    3
    Input By Pic    server_address_input.png    200   0    ${cmsip}
    Input By Pic    server_port_input.png    200   0    ${cmsport}
    Click By Pic    next.png
    Sleep    3
    Click By Pic    area_autotest.png
    Click By Pic    next.png
    Sleep    3
    Input By Pic    area_win_input.png    0   -50   ${localusr}
    Input By Pic    area_win_input.png    -100   0    ${localpasswd}
    Click By Pic    next.png
    Sleep    3
    Screen Should Contain Pic    account_zhanghaobucunzai.png
    Click By Pic     queding.png
    Click By Pic     x_gray.png


124379-【初始化配置】选择终端所属区域--所选区域普通用户校验
    ${cmsweb}=    Get Single Option Value    common    cmsweb
    ${browser}=    Get Single Option Value    common    browser
    ${login_user}=    Get Single Option Value    common    adminuser
    ${login_passwd}=    Get Single Option Value    common    adminpasswd
    ${cmsip}=    Get Single Option Value    common    cmsip
    ${cmsport}=    Get Single Option Value    common    cmsport
    ${username}=     Get Single Option Value    user    userpt
    ${areaname}=    Get Single Option Value    area    areaname
    Login Cms    ${cmsweb}    ${login_user}    ${login_passwd}
    Check Ladpuser Exist   PT    ${username}
    Addusertoare Beforecheck    ${areaname}   ${username}
    Init Dmcw
    Start Dmcw
    Sleep    3
    Input By Pic    server_address_input.png    200   0    ${cmsip}
    Input By Pic    server_port_input.png    200   0    ${cmsport}
    Click By Pic    next.png
    Sleep    3
    Click By Pic    area_autotest.png
    Click By Pic    next.png
    Sleep    3
    Input By Pic    area_win_input.png    0   -50   ${username}
    Input By Pic    area_win_input.png    -100   0    abcd1234
    Click By Pic    next.png
    Sleep    3
    Screen Should Contain Pic    zhongduanmingcheng.png
    Click By Pic     x_gray.png
    Close All Browsers


124396-【初始化配置】选择终端所属区域--校验管理员界面点击查看密码按钮
    ${cmsweb}=    Get Single Option Value    common    cmsweb
    ${browser}=    Get Single Option Value    common    browser
    ${login_user}=    Get Single Option Value    common    adminuser
    ${login_passwd}=    Get Single Option Value    common    adminpasswd
    ${cmsip}=    Get Single Option Value    common    cmsip
    ${cmsport}=    Get Single Option Value    common    cmsport
    ${username}=     Get Single Option Value    user    username01
    ${areaname}=    Get Single Option Value    area    areaname
    Init Dmcw
    Start Dmcw
    Sleep    3
    Input By Pic    server_address_input.png    200   0    ${cmsip}
    Input By Pic    server_port_input.png    200   0    ${cmsport}
    Click By Pic    next.png
    Sleep    3
    Click By Pic    area_autotest.png
    Click By Pic    next.png
    Sleep    3
    Input By Pic    area_win_input.png    0   -50   ${username}
    Input By Pic    area_win_input.png    -100   0    abcd1234
    Click By Pic    xianshimima_blueeye.png
    Sleep    1
    Screen Should Contain Pic    ladpuser_passwd.png
    Sleep    1
    Click By Pic    yincangmima_blueeye.png
    Sleep    1
    Screen Should Contain Pic    xianshimima_blueeye.png
    Click By Pic     x_gray.png


124400-【初始化配置】创建终端名称--修改区域
    ${cmsweb}=    Get Single Option Value    common    cmsweb
    ${browser}=    Get Single Option Value    common    browser
    ${login_user}=    Get Single Option Value    common    adminuser
    ${login_passwd}=    Get Single Option Value    common    adminpasswd
    ${cmsip}=    Get Single Option Value    common    cmsip
    ${cmsport}=    Get Single Option Value    common    cmsport
    ${username}=     Get Single Option Value    user    username01
    ${username1}=    Get Single Option Value    user    usergl
    ${areaname}=    Get Single Option Value    area    areaname
    ${areaname1}=    Get Single Option Value    area    areaname1
    Login Cms    ${cmsweb}    ${login_user}    ${login_passwd}
    Add Area    根区域    ${areaname1}    "uos"
    Check Ladpuser Exist    GL    ${username1}
    Addusertoare Beforecheck    ${areaname1}   ${username1}
    Init Dmcw
    Start Dmcw
    Sleep    3
    Input By Pic    server_address_input.png    200   0    ${cmsip}
    Input By Pic    server_port_input.png    200   0    ${cmsport}
    Click By Pic    next.png
    Sleep    3
    Click By Pic    area_autotest.png
    Click By Pic    next.png
    Sleep    3
    Input By Pic    area_win_input.png    0   -50   ${username}
    Input By Pic    area_win_input.png    -100   0    abcd1234
    Click By Pic    next.png
    Sleep    3
    Screen Should Contain Pic    suoxuanquyu_areaname_autotest.png
    Click By Pic    previous.png
    Sleep   3
    Click By Pic    previous.png
    Click By Pic    area_uostest.png
    Click By Pic    next.png
    Sleep   3
    Click By Pic Offset    xianshimima_blueeye.png    -8    -45
    Sleep    1
    Input By Pic    area_win_input.png    0   -50   ${username1}
    Click By Pic    next.png
    Sleep    3
    Screen Should Contain Pic    quyu_uostest.png
    Click By Pic     x_gray.png
    Close All Browsers


124368-【初始化配置】选择终端所属区域--只能选择一个区域
    ${cmsip}=    Get Single Option Value    common    cmsip
    ${cmsport}=    Get Single Option Value    common    cmsport
    Init Dmcw
    Start Dmcw
    Sleep    3
    Input By Pic    server_address_input.png    200   0    ${cmsip}
    Input By Pic    server_port_input.png    200   0    ${cmsport}
    Click By Pic    next.png
    Sleep    3
    Click By Pic    area_autotest.png
    Sleep    1
    Click By Pic    area_uostest.png
    Sleep   1
    Screen Should Contain Pic    suoxuanquyu_uostest.png
    Click By Pic     x_gray.png


124407-【初始化配置】创建终端名称--终端名称输入数字+字母+常用字符
    ${cmsip}=    Get Single Option Value    common    cmsip
    ${cmsport}=    Get Single Option Value    common    cmsport
    ${username}=     Get Single Option Value    user    username01
    ${cmsweb}=    Get Single Option Value    common    cmsweb
    ${browser}=    Get Single Option Value    common    browser
    ${login_user}=    Get Single Option Value    common    adminuser
    ${login_passwd}=    Get Single Option Value    common    adminpasswd
    ${areaname}=    Get Single Option Value    area    areaname
    Init Dmcw
    Start Dmcw
    Sleep    3
    Input By Pic    server_address_input.png    200   0    ${cmsip}
    Sleep    1
    Input By Pic    server_port_input.png    200   0    ${cmsport}
    Sleep    1
    Click By Pic    next.png
    Sleep    1
    Click By Pic    area_autotest.png
    Click By Pic    next.png
    Input By Pic    area_win_input.png    0   -50    ${username}
    Input By Pic    area_win_input.png    -100   0    abcd1234
    Click By Pic    next.png
    Sleep    3
    Click By Pic Offset    next.png    47    -56
    Input By Pic    next.png    -69    -61    123test!
    Click By Pic    next.png
    Sleep   3
    Screen Should Contain Pic    wancheng_blue.png
    Click By Pic     x_gray.png


124411-【初始化配置】创建终端名称--终端名称输入不存在的终端名字
    ${cmsip}=    Get Single Option Value    common    cmsip
    ${cmsport}=    Get Single Option Value    common    cmsport
    ${username}=     Get Single Option Value    user    username01
    ${cmsweb}=    Get Single Option Value    common    cmsweb
    ${browser}=    Get Single Option Value    common    browser
    ${login_user}=    Get Single Option Value    common    adminuser
    ${login_passwd}=    Get Single Option Value    common    adminpasswd
    ${areaname}=    Get Single Option Value    area    areaname
    Init Dmcw
    Start Dmcw
    Sleep    3
    Input By Pic    server_address_input.png    200   0    ${cmsip}
    Sleep    1
    Input By Pic    server_port_input.png    200   0    ${cmsport}
    Sleep    1
    Click By Pic    next.png
    Sleep    1
    Click By Pic    area_autotest.png
    Click By Pic    next.png
    Input By Pic    area_win_input.png    0   -50    ${username}
    Input By Pic    area_win_input.png    -100   0    abcd1234
    Click By Pic    next.png
    Sleep    3
    Click By Pic Offset    next.png    47    -56
    Input By Pic    next.png    -69    -61    uos123
    Click By Pic    next.png
    Sleep   3
    Screen Should Contain Pic    wancheng_blue.png
    Click By Pic     x_gray.png


124413-【初始化配置】完成配置界面--界面展示信息
    ${cmsip}=    Get Single Option Value    common    cmsip
    ${cmsport}=    Get Single Option Value    common    cmsport
    ${username}=     Get Single Option Value    user    username01
    ${cmsweb}=    Get Single Option Value    common    cmsweb
    ${browser}=    Get Single Option Value    common    browser
    ${login_user}=    Get Single Option Value    common    adminuser
    ${login_passwd}=    Get Single Option Value    common    adminpasswd
    ${areaname}=    Get Single Option Value    area    areaname
    Init Dmcw
    Start Dmcw
    Sleep    3
    Input By Pic    server_address_input.png    200   0    ${cmsip}
    Sleep    1
    Input By Pic    server_port_input.png    200   0    ${cmsport}
    Sleep    1
    Click By Pic    next.png
    Sleep    1
    Click By Pic    area_autotest.png
    Click By Pic    next.png
    Input By Pic    area_win_input.png    0   -50    ${username}
    Input By Pic    area_win_input.png    -100   0    abcd1234
    Click By Pic    next.png
    Sleep    3
    Click By Pic Offset    next.png    47    -56
    Input By Pic    next.png    -69    -61    uos123
    Click By Pic    next.png
    Sleep   3
    Screen Should Contain Pic    wancheng_blue.png
    Screen Should Contain Pic    wancheng_10-20-12-230.png
    Screen Should Contain Pic    wancheng-autotest.png
    Screen Should Contain Pic    wancheng-uos123.png
    Click By Pic     x_gray.png


124418&124421&124425-【初始化配置】完成配置界面--配置界面点击完成
    ${cmsip}=    Get Single Option Value    common    cmsip
    ${cmsport}=    Get Single Option Value    common    cmsport
    ${username}=     Get Single Option Value    user    username01
    ${cmsweb}=    Get Single Option Value    common    cmsweb
    ${browser}=    Get Single Option Value    common    browser
    ${login_user}=    Get Single Option Value    common    adminuser
    ${login_passwd}=    Get Single Option Value    common    adminpasswd
    ${areaname}=    Get Single Option Value    area    areaname
    Init Dmcw
    Start Dmcw
    Sleep    3
    Input By Pic    server_address_input.png    200   0    ${cmsip}
    Sleep    1
    Input By Pic    server_port_input.png    200   0    ${cmsport}
    Sleep    1
    Click By Pic    next.png
    Sleep    1
    Click By Pic    area_autotest.png
    Click By Pic    next.png
    Input By Pic    area_win_input.png    0   -50    ${username}
    Input By Pic    area_win_input.png    -100   0    abcd1234
    Click By Pic    next.png
    Sleep    3
    Click By Pic    next.png
    Sleep    1
    Screen Should Contain Pic    wancheng_blue.png
    log    124418-【初始化配置】完成配置界面--在完成配置界面点击完成测试通过
    Click By Pic    wancheng_blue.png
    Sleep    5
    Screen Should Contain Pic    peizhizhong.png
    log    124421-【初始化配置】完成配置界面--在加入管控界面点击加入测试通过
    Sleep    90
    Screen Should Contain Pic    lijichongqi.png
    Click By Pic    lijichongqi.png
    log    124425-【初始化配置】完成配置界面--配置完成测试通过


124423-【初始化配置】完成配置界面--完成配置后查看区内终端
    ${cmsip}=    Get Single Option Value    common    cmsip
    ${cmsport}=    Get Single Option Value    common    cmsport
    ${username}=     Get Single Option Value    user    username01
    ${cmsweb}=    Get Single Option Value    common    cmsweb
    ${browser}=    Get Single Option Value    common    browser
    ${login_user}=    Get Single Option Value    common    adminuser
    ${login_passwd}=    Get Single Option Value    common    adminpasswd
    ${areaname}=    Get Single Option Value    area    areaname
    ${cientname}=    Get Single Option Value   client    clientname
    Login Cms    ${cmsweb}    ${login_user}    ${login_passwd}
    Check Client Inarea      ${cientname}    ${areaname}    True
    Close All Browsers

124422-【初始化配置】完成配置界面--完成配置后查看终端列表
    ${cmsip}=    Get Single Option Value    common    cmsip
    ${cmsport}=    Get Single Option Value    common    cmsport
    ${username}=     Get Single Option Value    user    username01
    ${cmsweb}=    Get Single Option Value    common    cmsweb
    ${browser}=    Get Single Option Value    common    browser
    ${login_user}=    Get Single Option Value    common    adminuser
    ${login_passwd}=    Get Single Option Value    common    adminpasswd
    ${areaname}=    Get Single Option Value    area    areaname
    ${cientname}=    Get Single Option Value   client    clientname
    Login Cms    ${cmsweb}    ${login_user}    ${login_passwd}
    Check Client Inclientcenter     ${cientname}    True
    Close All Browsers