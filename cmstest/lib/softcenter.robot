*** Settings ***
Library           SeleniumLibrary
Library           MultiClient

*** Keywords ***
Marksoftware
    [Arguments]    ${softname}    ${softtype}    ${softalias}    ${addtype}=True
    Comment    功能：标记软件
    Comment    软件名、软件类型、软件别名、添加是否成功
    Click Element    xpath://*[@id='m_ver_menu']/ul/li[5]/a/span
    Wait Until Page Contains Element    css:button[class='btn btn-primary']    ${3}
    Click Element    css:button[class='btn btn-primary']
    Input Text    id:keyword    ${softname}
    Click Element    css:i[class='flaticon-search']
    Click Elements    css:label[class='mat-checkbox-layout']    ${0}
    Sleep    ${1}
    Select From List By Label    css:select[id='soft-type']    ${softtype}
    Input Text    id:soft-name    ${softalias}
    Sleep    ${1}
    Click Element    css:button[class='btn btn-primary']
    Run Keyword Unless    ${addtype}    Wait Until Page Contains Element    id:toast-container    ${5}
    Run Keyword Unless    ${addtype}    Wait Until Page Contains    该软件在该区域内已被添加过!
    Log    软件标记失败
    Run Keyword If    ${addtype}    Wait Until Page Contains Element    css:table[class='table dataTable table-hover advanced-table ng-star-inserted']    ${5}
    Run Keyword Unless    ${addtype}    Click Elements    css:span[class='m-nav__link-text']    ${0}
    Table Cell Should Contain   css:table[class='table dataTable table-hover advanced-table ng-star-inserted    ${2}    ${3}    ${softalias}
    Log    软件标记成功


Check Software
    [Arguments]    ${softname}
    Comment    确保软件标记成功
    Click Element    xpath://*[@id='m_ver_menu']/ul/li[5]/a/span
    Sleep    ${3}
    Table Column Should Contain    css:table[class='table dataTable table-hover advanced-table ng-star-inserted']    ${3}    ${softname}


Checksoft Client
    [Arguments]    ${softname}    ${clientname}    ${softtest}=True
    [Return]    ${softstatus}
    Comment    检查终端详情中是否存在对应软件
    Click Elements    css:span[class='m-menu__link-text']    ${3}
    Sleep    ${3}
    Comment    找到指定名称的终端的行数，暂时不考虑换页
    ${index}=    Get Table Cell Num    css:table[class='table dataTable table-hover advanced-table ng-star-inserted']    ${clientname}
    ${index}=    Evaluate    ${index}+${1}
    Comment    勾选对应终端
    Click Elements    css:label[class='m-checkbox m-checkbox--single m-checkbox--solid m-checkbox--brand']    ${index}
    Sleep    1
    Comment    点击对应终端的操作图标
    ${index}=    Evaluate    ${index}+${1}
    Click Elements    css:span[class=mat-button-wrapper]    ${index}
    Comment    点击详情
    Click Elements Child    css:div[class='cdk-overlay-pane']    button[role="menuitem"]    ${0}    ${0}
    Sleep    1
    Comment    滚动到最下方
    Execute Javascript    window.scrollTo(0, 100)
    Comment    判断是否存在对应软件
    ${softstatus}=     Table Column Contain Isornot    css:table[class='table dataTable table-hover advanced-table']    ${2}    ${softname}    ${1}


Check Software Usagerecord Inpersonnel
    Comment    人员详情应存在软件记录
    [Arguments]    ${softname}    ${personnelname}
    Click Elements    css:span[class='m-menu__link-text']    ${2}
    Wait Until Page Contains Element    css:span[class='m-menu__link-text']    ${5}
    Sleep    3
    Input Text    css:input[id=keyword]    ${personnelname}
    Click Element    css:button[class='btn btn-sm btn-light m-btn m-btn--icon m-btn--icon-only m-btn--pill']
    Click Element    css:button[class='mat-icon-button']
    Click Elements    css:button[role='menuitem']    ${0}
    Tables Should Contain    css:table[class='table dataTable table-hover advanced-table']    hello    ${1}


Do Task From Soft Center
    Comment    功能：软件中心批量操作更新软件；参数:[软件列表]
    [Arguments]    ${softlist}
    Click Elements    css:span[class='m-menu__link-text']    ${4}
    Sleep    3
    :FOR    ${softname}  IN  @{softlist}
        \    Log    ${softname}
        \    ${index}=    Get Table Cell Num     css:table[class='table dataTable table-hover advanced-table ng-star-inserted']     ${softname}
        \    ${index}=    Evaluate    ${index}+${1}
        \    Click Elements    css:label[class='m-checkbox m-checkbox--single m-checkbox--solid m-checkbox--brand']    ${index}
    Scroll Element Into View    css:a[class='btn btn-secondary m-btn m-btn--icon']
    Click Element    css:button[class='btn btn-sm btn-secondary']
    Click Element Text    css:button[role='menuitem']    更新


Softcenter Op
    [Arguments]    ${softname}    ${op}=UP
    Comment    功能：软件中心-指定软件进行操作（更新、移除）参数：软件名称 操作类型
    Click Elements    css:span[class='m-menu__link-text']    ${4}
    Sleep    ${3}
    Scroll Element Into View    css:a[class='btn btn-secondary m-btn m-btn--icon']
    Comment    找到指定名称的软件
    ${index}=    Get Table Cell Num    css:table[class='table dataTable table-hover advanced-table ng-star-inserted']    ${softname}
    Comment    勾选对应软件
    ${index}=    Evaluate    ${index}+${1}
    Click Elements    css:label[class='m-checkbox m-checkbox--single m-checkbox--solid m-checkbox--brand']    ${index}
    Sleep    10
    Comment    点击对应行的操作图标
    ${index}=    Evaluate    ${index}+${1}
    Click Elements    css:span[class=mat-button-wrapper]    ${index}
    Sleep    10
    Comment    更新操作
    Run Keyword If    '${op}' == 'UP'    Click Elements    css:button[role='menuitem']    ${1}
    Comment    移除操作
    Run Keyword If    '${op}' == 'RM'    Click Elements    css:button[role='menuitem']      ${2}
    Run Keyword If    '${Op}' == 'RM'    Wait Until Page Contains Element    css:button[class='swal2-confirm swal2-styled']    ${5}
    Run Keyword If    '${Op}' == 'RM'     Click Element    css:button[class='swal2-confirm swal2-styled']


Check Software Ismarkd
    [Arguments]    ${softname}
    Comment    检查软件标记状态
    Click Element    xpath://*[@id='m_ver_menu']/ul/li[5]/a/span
    Sleep    ${3}
    ${softstatus}=   Table Column Contain Isornot    css:table[class='table dataTable table-hover advanced-table ng-star-inserted']    ${3}    ${softname}
    Log    ${softstatus}
    [Return]    ${softstatus}


Mark Software Only
    [Arguments]    ${softname}    ${softtype}    ${softalias}    ${softid}
    Comment    根据软件ID来区别不同架构的软件进行标记
    Comment    软件名、软件类型、软件别名、软件ID
    Wait Until Page Contains Element    css:button[class='btn btn-primary']    ${3}
    Click Element    css:button[class='btn btn-primary']
    Input Text   id:keyword    ${softname}
    Click Element    css:i[class='flaticon-search']
    Sleep    5
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    Click Elements    css:label[class='mat-checkbox-layout']    ${softid}
    Sleep    ${1}
    Scroll Element Into View     css:button[class='btn btn-sm btn-secondary']
    Select From List By Label    css:select[id='soft-type']    ${softtype}
    Input Text    id:soft-name    ${softalias}
    Sleep    ${1}
    Scroll Element Into View    css:button[class='btn btn-primary']
    Click Element    css:button[class='btn btn-primary']
    sleep    5
    Table Cell Should Contain   css:table[class='table dataTable table-hover advanced-table ng-star-inserted']    ${2}    ${3}    ${softalias}


Mark Software Byid
    [Arguments]    ${softname}    ${softtype}    ${softalias}    ${softid}
    Click Elements    css:span[class='m-menu__link-text']    ${4}
    Wait Until Page Contains Element    css:button[class='btn btn-primary']    ${5}
    Sleep    ${1}
    ${softstatus}=   Table Column Contain Isornot    css:table[class='table dataTable table-hover advanced-table ng-star-inserted']    ${3}    ${softalias}
    Run Keyword If    '${softstatus}' == 'False'    Mark_Software_Only    ${softname}    ${softtype}    ${softalias}    ${softid}


Install Soft For Client
    [Arguments]    ${softname}    ${areaname}    ${alasname}    ${softid}
    Comment  给客户端安装软件
    Mark Software Byid    ${softname}    应用软件   ${alasname}   ${softid}
    Comment  区域中添加软件
    Add Soft For Area    ${alasname}    ${areaname}
