*** Settings ***
Library           SeleniumLibrary
Library           MultiClient
Resource          lib/base.robot
Resource          lib/softcenter.robot
Library           CmsBase
Resource          lib/area.robot
Resource          lib/dmcwui.robot

*** Test Cases ***
223121-【加入域管】所属区域选择--选中区域后点击下一步
    ${cmsip}=    get single option value    common    cmsip
    ${cmsport}=    get single option value    common    cmsport
    Init Dmcw
    Start Dmcw
    Sleep    5
    Input By Pic    server_address_input.png    200   0    ${cmsip}
    Sleep    1
    Input By Pic    server_port_input.png    200   0    ${cmsport}
    Sleep    1
    Click By Pic    next.png
    Sleep    3
    Click By Pic    area_autotest.png
    Click By Pic    next.png
    Sleep    3
    Screen Should Contain Pic    web_account_interface.png
    Click By Pic     x_gray.png


223122-【加入域管】所属区域选择--不选区域点击下一步
    ${cmsip}=    get single option value    common    cmsip
    ${cmsport}=    get single option value    common    cmsport
    Init Dmcw
    Start Dmcw
    Sleep    5
    Input By Pic    server_address_input.png    200   0    ${cmsip}
    Sleep    1
    Input By Pic    server_port_input.png    200   0    ${cmsport}
    Sleep    3
    Click By Pic    next.png
    Sleep    3
    Screen Should Contain Pic    next_gray.png
    Click By Pic     x_gray.png


223120-【加入域管】所属区域选择--点击上一步按钮
    ${cmsip}=    get single option value    common    cmsip
    ${cmsport}=    get single option value    common    cmsport
    Init Dmcw
    Start Dmcw
    Sleep    5
    Input By Pic    server_address_input.png    200   0    ${cmsip}
    Sleep    1
    Input By Pic    server_port_input.png    200   0    ${cmsport}
    Click By Pic    next.png
    Sleep    3
    Click By Pic    previous.png
    Sleep    3
    Screen Should Contain Pic    serverset_ui.png
    Click By Pic     x_gray.png


223114-【加入域管】所属区域选择--服务器配置输入IP和端口号时界面元素检查
    ${cmsip}=    get single option value    common    cmsip
    ${cmsport}=    get single option value    common    cmsport
    Init Dmcw
    Start Dmcw
    Sleep    5
    Input By Pic    server_address_input.png    200   0    ${cmsip}
    Sleep    1
    Input By Pic    server_port_input.png    200   0    ${cmsport}
    Click By Pic    next.png
    Sleep   3
    Screen Should Contain Pic    gantanhao.png
    Screen Should Contain Pic    suoxuanquyu_areaname_autotest.png
    Screen Should Contain Pic    suoxuanquyu_shuaxin.png
    Click By Pic     x_gray.png


220502-【加入域管】服务器配置--终端数量限制未达上限
    ${cmsip}=    get single option value    common    cmsip
    ${cmsport}=    get single option value    common    cmsport
    Init Dmcw
    Start Dmcw
    Sleep    5
    Input By Pic    server_address_input.png    200   0    ${cmsip}
    Sleep    1
    Input By Pic    server_port_input.png    200   0    ${cmsport}
    Sleep    3
    Click By Pic    next.png
    Sleep    3
    Click By Pic    area_autotest.png
    Click By Pic    next.png
    Sleep    3
    Screen Should Contain Pic    web_account_interface.png
    Click By Pic     x_gray.png






