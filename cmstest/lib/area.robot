*** Settings ***
Library           SeleniumLibrary
Library           MultiClient

*** Keywords ***
Enter Area
    [Arguments]    ${areaname}
    Comment   Function:Switch to area which you specify
    Comment   Arguments[areaname]: Area name which you specify, string
    Click Elements    css:span[class='m-menu__link-text']    ${1}
    Sleep  3
    Scroll Element Into View    css:a[class='btn btn-secondary m-btn m-btn--icon']
    Scroll Element Into View Bylinkname    css:div[class='m-portlet__body']    ${areaname}
    Click Link Byname   css:div[class='m-portlet__body']    ${areaname}

Do Systemupdate Inarea By Dashboard
    Comment    功能:仪表盘下发系统更新
    Sleep    3
    Comment    滚动到指定位置
    Scroll Element Into View    css:button[class='btn btn-sm btn-secondary']
    Click Element    css:button[class='btn btn-sm btn-secondary ng-star-inserted']


Do Systemupdate Inarea Byclient
    [Arguments]    ${clientname}    ${tasktype}=Sys
    Comment    功能：区内终端操作-更新系统 参数：[终端名称、任务类型]
    Sleep    3
    Comment    滚动到指定位置
    Scroll Element Into View    css:li[class='nav-item m-tabs__item ng-star-inserted']    ${0}
    Comment    找到指定名称的终端的行数，暂时不考虑换页
    ${index}=    Get Tables Cell Num    css:table[class='table dataTable table-hover advanced-table']    ${1}    ${clientname}
    log    ${index}
    Comment    勾选对应终端
    Click Elements Child    css:table[class='table dataTable table-hover advanced-table']    mat-checkbox[class='mat-checkbox mat-accent ng-untouched ng-pristine ng-valid']     ${1}    ${index}
    Comment    点击对应行的操作图标
    #${index}=    Evaluate    ${index}+${1}
    Click Elements Child    css:table[class='table dataTable table-hover advanced-table']    button[class='mat-icon-button']    ${1}    ${index}
    Sleep    1
    Comment    系统更新任务下发
    Run Keyword If    '${tasktype}' == 'Sys'    Click Elements    css:button[role='menuitem']     ${0}


Do Softop Inarea Single
    [Arguments]    ${softname}    ${Op}=UP
    Comment    功能：区内软件操作 参数：[软件名称、操作类型]
    Sleep    3
    Comment    滚动到指定位置
    Scroll Element Into View    css:li[class='nav-item m-tabs__item ng-star-inserted']    ${0}
    Comment    找到指定名称的终端的行数，暂时不考虑换页
    ${index}=    Get Tables Cell Num    css:table[class='table dataTable table-hover advanced-table']    ${2}    ${softname}
    log    ${index}
    Comment    勾选对应软件
    Click Elements Child    css:table[class='table dataTable table-hover advanced-table']    mat-checkbox[class='mat-checkbox mat-accent ng-untouched ng-pristine ng-valid']     ${2}    ${index}
    Comment    点击对应行的操作图标
    Click Elements Child    css:table[class='table dataTable table-hover advanced-table']    button[class='mat-icon-button']    ${2}    ${index}
    Sleep    1
    Comment    选择操作类型
    Run Keyword If    '${Op}' == 'UP'    Click Elements    css:button[role='menuitem']    ${0}
    Run Keyword If    '${Op}' == 'RM'    Click Elements    css:button[role='menuitem']    ${2}
    Run Keyword If    '${Op}' == 'RM'    Wait Until Page Contains Element    css:button[class='swal2-confirm swal2-styled']    ${5}
    Run Keyword If    '${Op}' == 'RM'     Click Element    css:button[class='swal2-confirm swal2-styled']


Do Softop Inarea Batch
    Comment    功能：区内软件批量操作；参数:[软件列表，操作类型]
    [Arguments]    ${softlist}    ${Op}
    Sleep    3
    Comment    滚动到指定位置
    Scroll Element Into View    css:li[class='nav-item m-tabs__item ng-star-inserted']    ${0}
    ${numtmp}=    Set Variable    ${0}
    :FOR    ${softname}  IN  @{softlist}
        \    log    ${softname}
        \    ${index}=    Get Tables Cell Num    css:table[class='table dataTable table-hover advanced-table']    ${2}    ${softname}
        \    ${index}=    Evaluate    ${index}-${numtmp}
        \    Click Elements Child    css:table[class='table dataTable table-hover advanced-table']    mat-checkbox[class='mat-checkbox mat-accent ng-untouched ng-pristine ng-valid']     ${2}    ${index}
        \    ${numtmp}=    Evaluate    ${numtmp}+${1}
    Click Elements    css:button[class='btn btn-secondary btn-sm']    ${2}
    Comment    选择操作类型
    Run Keyword If    '${Op}' == 'UP'    Click Elements    css:button[role='menuitem']    ${0}
    Run Keyword If    '${Op}' == 'RM'    Click Elements    css:button[role='menuitem']    ${1}


Check Softstatus Inarea
    Comment    Function: Check software is or not in area's software list Arguments: softname, areaname
    [Arguments]    ${softname}    ${areaname}
    Enter Area    ${areaname}
    Comment    滚动到指定位置
    Scroll Element Into View    css:li[class='nav-item m-tabs__item ng-star-inserted']    ${0}
    Tables Column Should Contain    css:table[class='table dataTable table-hover advanced-table']    ${3}   ${softname}    ${2}


Set Basicset Wallpaper
    [Arguments]    ${areaname}    ${filepath}
    Comment    Function: Set wallpaper
    Sleep    3
    Click Elements    css:span[class='m-menu__link-text']    ${1}
    Enter Area    ${areaname}
    Comment    滚动到指定位置
    Scroll Element Into View    css:div[class='line-number']
    Click Element    css:button[class='btn btn-primary ng-star-inserted']
    Scroll Element Into View    css:button[class='btn btn-sm btn-secondary']    ${1}
    Click Elements    css:button[class='btn btn-sm btn-secondary']    ${0}
    Sleep    3
    Upload File    ${filepath}
    Sleep    3
    Scroll Element Into View    css:button[class='btn btn-sm btn-secondary']    ${1}
    Click Element    css:button[class='btn btn-sm btn-primary mr-3 ng-star-inserted']
    Scroll Element Into View    css:div[class='line-number']
    Click Element    css:button[class='btn btn-primary']


Do Userop Inarea Single
    [Arguments]    ${areaname}    ${username}    ${Op}=LOCK
    Comment    function: Do operation for user in area. Arguments: username, optype
    Enter Area    ${areaname}
    Sleep    3
    Comment    scroll to user op area
    Scroll Element Into View    css:button[class='btn btn-secondary btn-sm']    ${0}
    ${index}=    Get Tables Cell Num    css:table[class='table dataTable table-hover advanced-table']    ${0}    ${username}
    log    ${index}
    Comment    勾选对应用户
    Click Elements Child    css:table[class='table dataTable table-hover advanced-table']    mat-checkbox[class='mat-checkbox mat-accent ng-untouched ng-pristine ng-valid']     ${0}    ${index}
    Comment    点击对应行的操作图标
  #  ${index}=    Evaluate    ${index}
    Click Elements Child    css:table[class='table dataTable table-hover advanced-table']    button[class='mat-icon-button']    ${0}    ${index}
    Sleep    1
    Comment    选择操作类型
    ${index}=    Evaluate    ${index}+${2}
    Run Keyword If    '${Op}' == 'LOCK'    Click Elment Text    css:button[role='menuitem']     冻结
    Run Keyword If    '${Op}' == 'ACTIVE'    Click Elment Text    css:button[role='menuitem']     激活
    Run Keyword If    '${Op}' == 'ACTIVE'    Click Elment Text    css:button[role='menuitem']     激活
    Sleep    3
    Run Keyword If    '${Op}' == 'LOCK'    Tables Cell Should Contain    css:table[class='table dataTable table-hover advanced-table']    ${index}    ${5}    冻结    ${0}
    Run Keyword If    '${Op}' == 'ACTIVE'    Tables Cell Should Contain    css:table[class='table dataTable table-hover advanced-table']    ${index}    ${5}    激活    ${0}
    Run Keyword If    '${Op}' == 'RM'    Tables Column Should Not Contain    css:table[class='table dataTable table-hover advanced-table']    ${4}    ${username}    ${0}


Do Adduser To Area
    [Arguments]    ${areaname}    ${username}
    Comment    function: Add user to area
    Enter Area    ${areaname}
    Sleep    3
    Click Elements    css:button[class='btn btn-outline-dark']    ${0}
    Sleep    3
    Input Texts    css:input[id='keyword']    ${username}    ${4}
    Sleep    1
    Click Elements    css:button[class='btn btn-sm btn-light m-btn m-btn--icon m-btn--icon-only m-btn--pill']    ${4}
    Sleep    3
    Click Elements Child    css:table[class='table dataTable table-hover advanced-table']    label[class='mat-checkbox-layout']   ${6}    ${-2}
    Click Element     css:button[class='btn btn-primary']


Addusertoare Beforecheck
    [Arguments]    ${areaname}    ${username}
    Enter Area    ${areaname}
    Sleep    3
    Comment    scroll to user op area
    Scroll Element Into View    css:button[class='btn btn-secondary btn-sm']    ${0}
    ${status}=   Table Column Contain IsorNot    css:table[class='table dataTable table-hover advanced-table']    ${4}    ${username}    ${0}
    run keyword unless    '${status}' == 'True'    Do Adduser To Area    ${areaname}    ${username}


Do Addclient Forarea
    [Arguments]    ${areaname}    ${clientname}
    Comment    function: Add client to area
    Enter Area    ${areaname}
    Wait Until Page Contains Element    css:button[class='btn btn-outline-danger']    ${5}
    Click Elements    css:button[class='btn btn-outline-dark']    ${1}
    Wait Until Page Contains Element    css:button[class='btn btn-primary']    ${5}
    Input Texts    css:input[id='keyword']    ${clientname}    ${4}
    Sleep    1
    Click Elements    css:button[class='btn btn-sm btn-light m-btn m-btn--icon m-btn--icon-only m-btn--pill']    ${4}
    Sleep    3
    Click Elements Child    css:table[class='table dataTable table-hover advanced-table']    label[class='mat-checkbox-layout']   ${6}    ${-2}
    Click Element     css:button[class='btn btn-primary']


Do Del Area
    [Arguments]    ${areaname}
    Comment    function: Del area from area details
    Enter Area    ${areaname}
    Wait Until Page Contains Element    css:button[class='btn btn-outline-danger']    ${5}
    Click Element    css:button[class='btn btn-outline-danger']
    Wait Until Page Contains Element     css:input[class='swal2-input']    ${3}
    Input Text    css:input[class='swal2-input']    ${areaname}
    Click Element    css:button[class='swal2-confirm swal2-styled']


Check Client Inarea
    [Arguments]    ${clientname}    ${areaname}    ${status}=True
    Click Elements    css:span[class='m-menu__link-text']    ${1}
    Comment    功能：区内终端检查 参数：[终端名称、任务类型]
    Enter Area    ${areaname}
    Sleep    3
    Comment    滚动到指定位置
    Scroll Element Into View    css:li[class='nav-item m-tabs__item ng-star-inserted']    ${0}
    ${index}=    Get Tables Cell Num    css:table[class='table dataTable table-hover advanced-table']    ${1}    ${clientname}
    Run Keyword If   '${status}' == 'True'    Should Be True    ${index} >= ${0}
    Run Keyword If   '${status}' == 'False'    Should Be True    ${index} == None


Add Soft Inarea
    [Arguments]    ${softname}
    Comment    功能:区内添加软件
    Scroll Element Into View    css:button[class='btn btn-outline-dark']    ${2}
    Click Elements    css:button[class='btn btn-outline-dark']    ${2}
    Sleep    3
    Input Texts    css:input[id='keyword']    ${softname}    ${4}
    Sleep    3
    Click Elements    css:button[class='btn btn-sm btn-light m-btn m-btn--icon m-btn--icon-only m-btn--pill']    ${4}
    Sleep    3
    Click Elements Child    css:table[class='table dataTable table-hover advanced-table']    label[class='mat-checkbox-layout']   ${6}    ${1}
    Click Element     css:button[class='btn btn-primary']


Add Soft For Area
    Comment    Function: Check software is or not in area's software list Arguments: softname, areaname
    [Arguments]    ${softname}    ${areaname}
    Enter Area    ${areaname}
    Comment    滚动到指定位置
    Scroll Element Into View    css:li[class='nav-item m-tabs__item ng-star-inserted']    ${0}
    ${status}=    Table Column Contain IsorNot    css:table[class='table dataTable table-hover advanced-table']    ${3}   ${softname}    ${2}
    Run Keyword If    '${status}' == 'False'   Add Soft Inarea    ${softname}


