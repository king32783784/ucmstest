*** Settings ***
Library           SeleniumLibrary
Library           MultiClient
Library           Collections

*** Keywords ***
Do Task Sys Byclient
    [Arguments]    ${clientname}=ALL    ${timer}=NOW
    Comment    任务管理-添加任务-系统更新
    Click Elements    css:span[class='m-menu__link-text']    ${9}
    Wait Until Page Contains Element    css:i[class='flaticon-add']    ${3}
    Click Element    css:i[class='flaticon-add']
    Run Keyword If    '${timer}' == 'NOW'    log    pass
    Run Keyword If    '${timer}' == 'TIME'    task_settimer
    Run Keyword If    '${timer}' == 'WEEK'    task_week
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    Comment    点击下一步
    Wait Until Page Contains Element    css:button[class='btn btn-primary ng-star-inserted']    ${3}
    Click Element    css:button[class='btn btn-primary ng-star-inserted']
    Comment    选择终端
    Task Choose Client    ${clientname}
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    Wait Until Page Contains Element    css:button[class='btn btn-primary ng-star-inserted']    ${3}
    Comment    点击下发
    Click Element    css:button[class='btn btn-primary ng-star-inserted']


Do Task Now Byarea
    [Arguments]    ${tasktype}=system    ${areaname}=ALL
    Comment    下发任务-任务管理-区域视角
    Click Elements    css:span[class='m-menu__link-text']    ${9}
    Comment    点击任务创建
    Wait Until Page Contains Element    css:i[class='flaticon-add']    ${3}
    Click Element    css:i[class='flaticon-add']
    Comment    选择任务类型
    Comment    点击下一步
    Wait Until Page Contains Element    css:button[class='btn btn-primary ng-star-inserted']    ${3}
    Click Element    css:button[class='btn btn-primary ng-star-inserted']
    Sleep    1
    Task Choose Area   ${areaname}
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    Wait Until Page Contains Element    css:button[class='btn btn-primary ng-star-inserted']    ${3}
    Comment    点击下发
    Click Element    css:button[class='btn btn-primary ng-star-inserted']


Do Task Soft Bysoft
    [Arguments]    ${timer}=NOW    ${selecttype}=SOFT    ${softname}=ALL    ${areaname}=ALL
    Comment    任务管理-添加任务-软件更新
    Click Elements    css:span[class='m-menu__link-text']    ${9}
    Comment    点击任务创建
    Wait Until Page Contains Element    css:i[class='flaticon-add']    ${3}
    Click Element    css:i[class='flaticon-add']
    Comment    选择任务类型-软件更新
    Click Elements    css:mat-radio-button[class='mat-radio-button mat-accent']    ${0}
    Comment    选择任务执行时间
    Run Keyword If    '${timer}' == 'NOW'    log    pass
    Run Keyword If    '${timer}' == 'TIME'    task_settimer
    Run Keyword If    '${timer}' == 'WEEK'    task_week
    Comment    点击下一步
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    Wait Until Page Contains Element    css:button[class='btn btn-primary ng-star-inserted']    ${3}
    Click Element    css:button[class='btn btn-primary ng-star-inserted']
    Comment    按软件选择
    Run Keyword If    '${selecttype}' == 'SOFT'    Task_Choose_Soft    ${softname}
    Comment    按区域选择
    Run Keyword If    '${selecttype}' == 'AREA'    Task_Choose_Area    ${areaname}
    Comment    点击下发
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    css:button[class='btn btn-primary ng-star-inserted']


Do Task Script
    [Arguments]    ${filepath}    ${timer}=NOW    ${selecttype}=Client    ${clientname}=ALL    ${areaname}=ALL
    Comment    任务管理-添加任务-下发脚本    参数[脚本路径、时间类型、下发类型、终端名称、区域名称]
    Click Elements    css:span[class='m-menu__link-text']    ${9}
    Wait Until Page Contains Element    css:i[class='flaticon-add']    ${3}
    Click Element    css:i[class='flaticon-add']
    Click Elements    css:mat-radio-button[class='mat-radio-button mat-accent']    ${1}
    Run Keyword If    '${timer}' == 'NOW'    log    pass
    Run Keyword If    '${timer}' == 'TIME'    task_settimer
    Run Keyword If    '${timer}' == 'WEEK'    task_week
    Click Element    css:button[class='btn btn-sm btn-secondary ng-star-inserted']
    Sleep    3
    Upload File    ${filepath}
    Sleep    3
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    Wait Until Page Contains Element    css:button[class='btn btn-primary ng-star-inserted']    ${3}
    Click Element    css:button[class='btn btn-primary ng-star-inserted']
    Run Keyword If    '${selecttype}' == 'CLIENT'    Click Elements    css:label[class='mat-radio-label']    ${7}
    Task Choose Client    ${clientname}
    Run Keyword If    '${selecttype}' == 'AREA'    Task_Choose_Area    ${areaname}
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    css:button[class='btn btn-primary ng-star-inserted']


Do Task From Client Center
    [Arguments]    ${clientname}    ${tasktype}=Sys
    Comment    终端中心选择终端下发任务
    Click Elements    css:span[class='m-menu__link-text']    ${3}
    Sleep    ${3}
    Comment    找到指定名称的终端的行数，暂时不考虑换页
    ${index}=    get_table_cell_num    css:table[class='table dataTable table-hover advanced-table ng-star-inserted']    ${clientname}
    ${index}=    Evaluate    ${index}+${1}
    Comment    勾选对应终端
    Click Elements    css:label[class='m-checkbox m-checkbox--single m-checkbox--solid m-checkbox--brand']    ${index}
    Comment    点击对应行的操作图标
    ${index}=    Evaluate    ${index}+${1}
    Click Elements    css:span[class=mat-button-wrapper]    ${index}
    Comment    点击更新
    Click Element    css:button[class='mat-menu-item mat-menu-item-submenu-trigger']
    Sleep    1
    Comment    系统更新任务下发
    Run Keyword If    '${tasktype}' == 'Sys'    Click Elements Child   css:div[class='cdk-overlay-pane']    button[role="menuitem"]    ${1}    ${0}
    Comment    软件更新任务下发
    Run Keyword If    '${tasktype}' == 'Soft'    Click Elements Child   css:div[class='cdk-overlay-pane']    button[role="menuitem"]    ${1}    ${1}

Clientcenter Details Op
    [Arguments]    ${clientname}    ${op}=SYS
    Comment    终端中心-终端详情操作
    Click Elements    css:span[class='m-menu__link-text']    ${3}
    Sleep    ${3}
    Comment    找到指定名称的终端的行数，暂时不考虑换页
    ${index}=    get_table_cell_num    css:table[class='table dataTable table-hover advanced-table ng-star-inserted']    ${clientname}
    Comment    勾选对应终端
    Click Elements    css:label[class='m-checkbox m-checkbox--single m-checkbox--solid m-checkbox--brand']    ${index}
    Comment    点击对应行的操作图标
    ${index}=    Evaluate    ${index}+${2}
    Click Elements    css:span[class=mat-button-wrapper]    ${index}
    Comment    点击详情
    Click Elements Child   css:div[class='cdk-overlay-pane']    button[role="menuitem"]    ${0}    ${0}
    Sleep    1
    Comment    系统更新任务下发
    Wait Until Page Contains Element    css:button[class="btn btn-secondary mr-3"]    ${3}
    Run Keyword If    '${op}' == 'SYS'    Click Element    css:button[class="btn btn-secondary mr-3"]


Task Sendmessage User
    [Arguments]    ${username}    ${msgtitle}   ${timer}=NOW
    Comment    Function：Send platform message Arguments：[username、Enforcement rules]
    Click Elements    css:span[class='m-menu__link-text']    ${8}
    Sleep   3
    Click Element    css:span[class='mat-tab-link']
    Wait Until Element Is Visible    css:button[class='btn btn-info m-btn m-btn--icon']
    Sleep   1
    Click Element    css:button[class='btn btn-info m-btn m-btn--icon']
    Run Keyword If    '${timer}' == 'NOW'    log     NOW
    Input Text    css:input[id='keyword']    ${username}
    Click Element    css:button[class='btn btn-sm btn-light m-btn m-btn--icon m-btn--icon-only m-btn--pill']
    Sleep   1
    Click Elements    css:label[class='mat-checkbox-layout']    ${1}
    Input Text    css:input[id='title']    ${msgtitle}
    Input Text    css:textarea[id='content']    autotest
    Click Element    css:button[class='btn btn-primary']
    Comment    Message send done!
    Comment    Check message send status
    Sleep   3
    Table Cell Should Contain   css:table[class='table dataTable table-hover advanced-table ng-star-inserted']    ${2}    ${3}    ${msgtitle}


Check Task Nums
    [Arguments]    ${areaname}    ${taskstatus}    ${tasktime}    ${tasktype}
    Comment    检查指定类型任务数量
    Click Elements    css:span[class='m-menu__link-text']    ${9}
    Sleep    ${1}
    Click Elements    css:span[class='mat-tab-link ng-star-inserted']    ${1}
    Sleep    ${1}
    Select From List By Label   css:mat-select[id='mat-select-0']    autotest

Task Choose Area
    [Arguments]    ${areaname}
    Comment    按区域选择
    ${index}=    get_element_index_bytext    css:div[class='zone-info ng-star-inserted']    ${areaname}
    Click Elements    css:mat-checkbox[class='mat-checkbox mat-accent ng-star-inserted']    ${index}

Task Choose Soft
    [Arguments]    ${softname}
    Comment    按软件选择
    Click Elements    css:mat-radio-button[class='mat-radio-button mat-accent']    ${5}
    Comment    选择软件
    Run Keyword If    '${softname}' == 'ALL'    scroll_element_into_view    css:button[class='btn btn-primary ng-star-inserted']
    Run Keyword If    '${softname}' == 'ALL'    Click Elements    css:button[class='btn btn-sm btn-secondary']    ${1}
    ${index}=    get_tables_cell_num    css:table[class='table dataTable table-hover advanced-table']    ${1}    ${softname}
   # ${index1}=    Evaluate    ${index}+${1}
  #  scroll_element_into_view_tmp    css:table[class='table dataTable table-hover advanced-table']    mat-checkbox[class='mat-checkbox mat-accent ng-untouched ng-pristine ng-valid']    ${1}    ${index1}
    Click Elements Child   css:table[class='table dataTable table-hover advanced-table']    mat-checkbox[class='mat-checkbox mat-accent ng-untouched ng-pristine ng-valid']    ${1}    ${index}

Task Choose Client
    [Arguments]    ${clientname}
    Comment    按终端选择
    Click Elements    css:mat-radio-button[class='mat-radio-button mat-accent']    ${4}
    Comment    选择终端
   # scroll_element_into_view    css:button[class='btn btn-primary ng-star-inserted']
    Execute Javascript    window.scrollTo(0, 40)
    ${index}=    get_tables_cell_num    css:table[class='table dataTable table-hover advanced-table']    ${0}    ${clientname}
    Click Elements Child    css:table[class='table dataTable table-hover advanced-table']    mat-checkbox[class='mat-checkbox mat-accent ng-untouched ng-pristine ng-valid']    ${0}    ${index}
    Run Keyword If    '${clientname}' == 'ALL'    Click Elements    css:button[class='btn btn-sm btn-secondary']    ${1}

Task Settimer
    [Arguments]    ${minutes}=2
    Click Elements    css:mat-radio-button[class='mat-radio-button mat-accent']    ${2}
    click Elements Times    css:span[class='chevron ngb-tp-chevron']    ${3}    ${minutes}

Task Week
    [Arguments]    ${minutes}=2
    Click Elements    css:mat-radio-button[class='mat-radio-button mat-accent']    ${3}
    ${timelist}=    getnexttime    ${2}
    ${weeknum}=    Get From List    ${timelist}    ${6}
    ${hour}=    Get From List    ${timelist}    ${3}
    ${minute}=    Get From List    ${timelist}    ${4}
    Run Keyword If    '${weeknum}' == '7'    ${weeknum}'=    Evaluate    ${0}
    Sleep    3
    Click Elements    css:label[class='m-checkbox m-checkbox--single m-checkbox--solid m-checkbox--brand']    ${weeknum}
    # Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    # Execute Javascript    window.scrollTo(100,400)
    # click_elements_times    css:span[class='chevron ngb-tp-chevron']    ${3}    ${minutes}
    Input Texts    css:input[class='ngb-tp-input form-control']    ${hour}    ${0}
    Input Texts    css:input[class='ngb-tp-input form-control']    ${minute}    ${1}
