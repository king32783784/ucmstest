*** Settings ***
Library           SeleniumLibrary
Library           MultiClient

*** Keywords ***

Do Op Inpersonnel
    Comment    人员详情停用
    [Arguments]    ${personnelname}   ${Op}=STOP
    Click Elements    css:span[class='m-menu__link-text']    ${2}
    Wait Until Page Contains Element    css:i[class='flaticon-add']    ${5}
    Sleep    3
    Input Text   css:input[id=keyword]    ${personnelname}
    Click Element    css:button[class='btn btn-sm btn-light m-btn m-btn--icon m-btn--icon-only m-btn--pill']
    Click Element    css:button[class='mat-icon-button']
    Click Elements    css:button[role='menuitem']    ${0}
    Sleep   3
    Run Keyword If    '${Op}' == 'STOP'    Op Stop
    Run Keyword If    '${Op}' == 'STAT'    Op Start
    Run Keyword If    '${Op}' == 'DEL'    Click Element   css:button[class='btn btn-danger ml-3']
    Wait Until Page Contains Element    css:button[class='swal2-confirm swal2-styled']    ${3}
    Click Element    css:button[class='swal2-confirm swal2-styled']


Op Start
    ${status1}=    Page Contain Element Isornot    css:button[class='btn btn-outline-danger ng-star-inserted']    1
    Run Keyword If    '${status1}' == 'True'    Click Element    css:button[class='btn btn-outline-danger ng-star-inserted']


Op Stop
    ${status1}=    Page Contain Element Isornot     css:button[class='btn btn-outline-success ng-star-inserted']    1
    Run Keyword If    '${status1}' == 'True'    Click Element     css:button[class='btn btn-outline-success ng-star-inserted']


Do Add Ladpuser
    [Arguments]    ${usertype}=GL    ${usrname}=
    Click Elements    css:span[class='m-menu__link-text']    ${2}
    Wait Until Page Contains Element    css:i[class='flaticon-add']    ${5}
    Sleep    1
    Click Element    css:i[class='flaticon-add']
    Sleep   3
    Run Keyword If    '${usertype}' == 'GL'    Select From List By Value    css:select[id='user-type']    1
    Run Keyword If    '${usertype}' == 'PT'    Select From List By Value    css:select[id='user-type']    0
    Input Text   css:input[id=full_name]    ${usrname}
    Input Text   css:input[id=ldap_username]    ${usrname}
    Input Text   css:input[id=ldap_password]    abcd1234
    Input Text   css:input[id=password_verify]    abcd1234
    ${phoneno}=    Get Phone No
    Input Text   css:input[id=phone]    ${phoneno}
    Click Element    css:button[class='btn btn-primary']


Check Ladpuser Exist
    [Arguments]    ${usertype}=GL    ${usrname}=
    Click Elements    css:span[class='m-menu__link-text']    ${2}
    Wait Until Page Contains Element    css:i[class='flaticon-add']    ${5}
    Sleep    3
    Input Text   css:input[id=keyword]    ${usrname}
    Click Element    css:button[class='btn btn-sm btn-light m-btn m-btn--icon m-btn--icon-only m-btn--pill']
    ${status}=   Table Column Contain Isornot    css:table[class='table dataTable table-hover advanced-table ng-star-inserted']    ${3}    ${usrname}
    Log    ${status}
    Run Keyword Unless    '${status}' == 'True'    Do Add Ladpuser    ${usertype}    ${usrname}



