*** Settings ***
Documentation    Scrape quotes and handle pagination.
Resource         ../../config/browsers.robot
Resource         ../../resources/test_data.robot
Suite Setup      Open Browser To URL    ${QUOTES_URL}
Suite Teardown   Close All Test Browsers
Test Timeout     30 seconds

*** Test Cases ***
Scrape First Page Quotes
    [Documentation]    Get all quotes on first page.
    @{quotes}=    Get WebElements    css=.quote span.text
    ${count}=     Get Length         ${quotes}
    Log           Found ${count} quotes on first page.
    Should Be True    ${count} > 0

Navigate To Next Page
    [Documentation]    Go to next page using pagination.
    Click Link     Next
    Page Should Contain Element    css=.quote
