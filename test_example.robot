*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${URL}            https://www.google.com
${SEARCH_TERM}    Robot Framework

*** Test Cases ***
Open Browser And Search
    [Documentation]    Open browser, search for Robot Framework, and close browser
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    name=q    timeout=10s
    Input Text    name=q    ${SEARCH_TERM}
    Press Keys    name=q    RETURN
    Wait Until Page Contains    Robot Framework    timeout=10s
    Sleep    2s
    Close Browser

*** Keywords ***
