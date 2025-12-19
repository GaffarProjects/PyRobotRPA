*** Settings ***
Documentation    Demo tests for the-internet (Herokuapp) examples.
Resource         ../../config/browsers.robot
Resource         ../../resources/test_data.robot
Suite Setup      Open Browser To URL    ${HEROKU_URL}
Suite Teardown   Close All Test Browsers
Test Timeout     30 seconds

*** Test Cases ***
Login Form Authentication
    [Documentation]    Verify valid login in Form Authentication.
    Click Link      Form Authentication
    Input Text      id=username    tomsmith
    Input Password  id=password    SuperSecretPassword!
    Click Button    css=button.radius
    Page Should Contain    You logged into a secure area!

Dropdown Selection
    [Documentation]    Select option from Dropdown.
    Go To           ${HEROKU_URL}dropdown
    Select From List By Value    id=dropdown    2
    List Selection Should Be     id=dropdown    Option 2

Checkboxes Toggle
    [Documentation]    Check and uncheck checkboxes.
    Go To           ${HEROKU_URL}checkboxes
    Click Element   xpath=(//input[@type="checkbox"])[1]
    Click Element   xpath=(//input[@type="checkbox"])[2]
    Checkbox Should Be Selected   xpath=(//input[@type="checkbox"])[1]

JavaScript Alert Handling
    [Documentation]    Accept JS alert.
    Go To           ${HEROKU_URL}javascript_alerts
    Click Button    xpath=//button[text()="Click for JS Alert"]
    Alert Should Be Present    I am a JS Alert
    Confirm Action

File Upload Example
    [Documentation]    Upload a file using Choose File.
    Go To           ${HEROKU_URL}upload
    Choose File     id=file-upload    ${TEST_DATA_FILE}
    Click Button    id=file-submit
    Page Should Contain    File Uploaded!
