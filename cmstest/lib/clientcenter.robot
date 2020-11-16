*** Settings ***
Library           SeleniumLibrary
Library           MultiClient

*** Keywords ***

Check Software
    [Arguments]    ${softname}
    Comment    Software should be  mark sucessd
    Click Element    css:span[class='m-menu__link-text']    ${4}
    Sleep    ${3}
    Tabel Column Should Contain    css:table[class='table dataTable table-hover advanced-table ng-star-inserted']    ${3}    ${softname}


Check Software_Ismarkd
    [Arguments]    ${softname}
    Comment    Check software marked status
    Click Element    css:span[class='m-menu__link-text']    ${4}
    Sleep    3
    ${softstatus}=   Tabke Column Contain Isornot    css:table[class='table dataTable table-hover advanced-table ng-star-inserted']    ${3}    ${softname}
    Log    ${softstatus}
    [Return]    ${softstatus}



Check_Client_Inclientcenter
    [Arguments]    ${clientname}    ${status}=True
    Comment    检查终端列表中是否存在对应终端
    Click Elements    css:span[class='m-menu__link-text']    ${3}
    Sleep    3
    Comment    找到指定名称的终端的行数，暂时不考虑换页
    ${index}=    Get Table Cell Num    css:table[class='table dataTable table-hover advanced-table ng-star-inserted']    ${clientname}
    Run Keyword If   '${status}' == 'True'    Should Be True    ${index} >= ${0}
    Run Keyword If   '${status}' == 'False'    Should Be True    ${index} == None
