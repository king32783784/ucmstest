*** Settings ***
Library           SeleniumLibrary
Library           MultiClient
Library           Collections

*** Keywords ***
Start Dmcw
    Comment   function: start dmcw win
    Click By XY    ${19}    ${883}
    Sleep    3
    Click By XY    ${127}   ${828}
    Sleep    3
    Click By Pic    otherfunc.png
    Sleep    3
    Click By Pic    dmcw.png


Init Dmcw
    Comment    test environment insert
    Run Cmd    sudo pkill dmcw
    Run Cmd    sudo rm -rf /etc/dmcw/userinfo.json


Start Control
    ${status}=    Check Pic On Screen     control_unionid.png
    Run Keyword Unless    '${status}' == 'True'    Click By Pic    control_start_gray.png
    Sleep   3
    ${status}=    Check Pic On Screen     control_systeminfo.png
    Run Keyword Unless    '${status}' == 'True'    Click By Pic    control_win_max.png

