*** Settings ***
Documentation    Product search and add-to-cart on AutomationPractice.
Resource         ../../config/browsers.robot
Resource         ../../resources/test_data.robot
Suite Setup      Open Browser To URL    ${AUTOPRACTICE_URL}
Suite Teardown   Close All Test Browsers
Test Timeout     30 seconds

*** Test Cases ***
Search And Add To Cart
    [Documentation]    Search for a dress and add to cart.
    Wait Until Element Is Visible    id=search_query_top    10s
    Input Text      id=search_query_top    dress
    Click Button    name=submit_search
    Wait Until Page Contains Element    css=.product_list    10s
    Click Element   css=.product_list .ajax_add_to_cart_button
    Wait Until Page Contains    Product successfully added to your shopping cart    10s
