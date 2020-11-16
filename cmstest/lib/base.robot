*** Settings ***
Library           SeleniumLibrary
Library           MultiClient

*** Keywords ***
Login Cms
    [Arguments]    ${url}    ${user}=admin    ${passwd}=1111
    Comment    Function: Log in to the domain management server
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Sleep    1
    Input Text    id=username    ${user}
    Input Text    id=password    ${passwd}
    Sleep    1
    Click Button    css:button[class='btn btn-primary px-5']
    Wait Until Page Contains Element    css:img[class='m--img-rounded m--marginless m--img-centered']    5
    Page Should Contain Element    css:img[class='m--img-rounded m--marginless m--img-centered']
    log    login success


Add Admin Withoutcheck
    [Arguments]    ${parentadmin}    ${adminname}    ${arealist}=-1    ${passwd}=abc123
    Comment    Add secondary administrator
    Click Element    css:button[routerlink='add']
    Wait Until Page Contains Element    css:select[formcontrolname='level_struct']    ${5}
    Select From List By Label    css:select[formcontrolname='level_struct']    ${parentadmin}
    Input Text    id:username    ${adminname}
    Sleep    1
    Input Text    id:full_name    ${adminname}
    Sleep    1
    Input Text    id:password    ${passwd}
    Sleep    1
    Input Text    id:confirm    ${passwd}
    Sleep    1
    Click Element    css:span[class='mat-tab-link ng-star-inserted']
    Sleep    1
    Click Element    css:mat-icon[class='mat-icon notranslate material-icons mat-icon-no-color']
    Sleep    5
    Click Elements    css:label[class='mat-checkbox-layout']    ${arealist}
    Click Element    css:button[class='btn btn-primary']
    Click Elements    css:div[class='mat-checkbox-inner-container']    0
    Click Element    css:button[class='btn btn-sm btn-outline-dark ml-3']

Add Webadmin
     [Arguments]    ${parentadmin}    ${adminname}    ${arealist}=-1    ${passwd}=abc123
     Comment    Function:Check if the administrator exists
     Scroll Element Into View    css:span[class='m-menu__link-text']    ${10}
     Click Elements    css:span[class='m-menu__link-text']    ${10}
     Wait Until Page Contains Element    css:span[class='m-nav__link-text']    ${3}
     Click Elements    css:span[class='m-nav__link-text']    ${3}
     Sleep    1
     ${status}=    found_link_byname    css:ul[class='jstree-children']    ${adminname}
     Run Keyword If   '${status}' == 'False'    Add Admin Withoutcheck    ${parentadmin}   ${adminname}    ${arealist}    ${passwd}

Add_Area_Without_Check
    [Arguments]    ${parentarea}    ${areaname}    ${areanote}="autotest"
    Comment    Function: Add area without check exist before
    Click Element    xpath://*[@id='m_ver_menu']/ul/li[2]/a/span
    Wait Until Page Contains Element    css:i[class=flaticon-add]    ${3}
    Click Element    css:i[class=flaticon-add]
    Select From List By Label    css:select[id='zone-parent']    ${parentarea}
    Input Text    id:zone-name    ${areaname}
    Input Text    id:zone-desc    ${areanote}
    Click Element    css:button[class='btn btn-primary']

Add_Area
    [Arguments]    ${parentarea}    ${areaname}    ${areanote}="autotest"
    Click Element    xpath://*[@id='m_ver_menu']/ul/li[2]/a/span
    Sleep  3
    ${status}=    found_link_byname    css:div[class='m-portlet__body']    ${areaname}
    Run Keyword If   '${status}' == 'False'    Add_Area_Without_Check    ${parentarea}    ${areaname}    ${areanote}

closebrowserfinally
    Comment    关闭浏览器即使已经fail
    Run Keyword IfTest Failed    Close All Browsers
    #Runcmd    taskkill /f /im chromedriver.exe
