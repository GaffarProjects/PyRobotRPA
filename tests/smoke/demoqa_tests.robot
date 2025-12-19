*** Settings ***
Documentation    Demo tests for DemoQA components.
Resource         ../../config/browsers.robot
Resource         ../../resources/test_data.robot
Suite Setup      Open Browser To URL    ${DEMOQA_URL}
Suite Teardown   Close All Test Browsers
Test Timeout     30 seconds

*** Test Cases ***
Fill Practice Form
    [Documentation]    Fill and submit the practice form.
    Go To           ${DEMOQA_URL}/automation-practice-form
    Input Text      id=firstName    Gaffar
    Input Text      id=lastName     Tester
    Input Text      id=userEmail    gaffar@example.com
    Click Element   xpath=//label[text()="Male"]
    Input Text      id=userNumber   9876543210
    Click Button    id=submit
    Page Should Contain    Thanks for submitting the form

Autocomplete Example
    [Documentation]    Use multi-select autocomplete.
    Go To           ${DEMOQA_URL}/auto-complete
    Click Element   id=autoCompleteMultipleInput
    Input Text      id=autoCompleteMultipleInput    Red
    Press Keys      id=autoCompleteMultipleInput    ENTER
    Page Should Contain    Red

Slider Control
    [Documentation]    Move slider.
    Go To           ${DEMOQA_URL}/slider
    Drag And Drop By Offset    css=input[type="range"]    30    0
    Page Should Contain Element    id=sliderValue

Tabs Navigation
    [Documentation]    Switch tabs.
    Go To           ${DEMOQA_URL}/tabs
    Click Element   id=demo-tab-origin
    Page Should Contain    Origin
