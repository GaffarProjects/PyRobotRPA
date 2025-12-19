*** Settings ***
Resource   ../../config/browsers.robot
Resource   ../../resources/database.robot
Resource  ../../resources/test_data.robot
Variables    ../../resources/test_data.py
Suite Setup    Open Browser To Url    ${SAUCE_URL}
Suite Teardown    Close All Browsers

**** Test Cases ***
Simple Checkout Start With DB Insert
    [Documentation]    Complete checkout flow and insert order into MySQL.
    [Tags]    checkout    db    smoke

    # Step 1: Login
    Input Text         id=user-name      ${SAUCE_USER}
    Input Password     id=password       ${SAUCE_PASS}
    Click Button       id=login-button
    Wait Until Page Contains    Products    10s

    # Step 2: Add item to cart
    Click Button       id=add-to-cart-sauce-labs-backpack
    Log To Console    Added Sauce Labs Backpack to cart

    # Step 3: Go to shopping cart
    Click Element      id=shopping_cart_container
    Wait Until Page Contains    Your Cart    5s

    # Step 4: Start checkout
    Click Button       id=checkout
    Wait Until Page Contains    Checkout: Your Information    5s

    # Step 5: Fill checkout form
    Input Text         id=first-name    ${FIRST_NAME}
    Input Text         id=last-name     ${LAST_NAME}
    Input Text         id=postal-code   ${POSTAL_CODE}
    Click Button       id=continue

    # Step 6: Verify we are on checkout overview
    Wait Until Page Contains    Checkout: Overview    5s
    Page Should Contain    Checkout: Overview
    Log To Console    Successfully reached Checkout Overview page

    # Step 7: INSERT ORDER INTO DATABASE (THIS IS KEY)
    Insert Order Row    ${SAUCE_USER}    ${PRODUCT_NAME}    1
    Log To Console    Order inserted into MySQL database

    # Step 8: Verify order was inserted
    Order Count For User Should Be    ${SAUCE_USER}    1
    Log To Console    Order count verified in database


    Verify All Test Orders In Database
    [Tags]    db    verify
    Get All Orders
    Get Orders By Product    ${PRODUCT_NAME}
    Log To Console    Test data population complete