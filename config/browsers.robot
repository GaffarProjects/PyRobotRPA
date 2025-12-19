*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${DELAY}      0.3s

*** Keywords ***
Open Browser To URL
    [Arguments]    ${url}
    Open Browser    ${url}    ${BROWSER}   # options=add_argument("--headless=new")
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Close All Test Browsers
    Close All Browsers
