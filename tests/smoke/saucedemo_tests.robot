*** Settings ***
Documentation    E-commerce login and basic flow on SauceDemo.
Resource         ../../config/browsers.robot
Resource         ../../resources/test_data.robot
Suite Setup      Open Browser To URL    ${SAUCE_URL}
Suite Teardown   Close All Test Browsers
Test Timeout     30 seconds

*** Test Cases ***
Valid Login Should Succeed
    [Documentation]    Standard user should login successfully.
    Input Text         id=user-name      ${SAUCE_USER}
    Input Password     id=password       ${SAUCE_PASS}
    Click Button       id=login-button
    Wait Until Page Contains    Products    10s
    Page Should Contain         Products

Add Item To Cart
    [Documentation]    Add an item to cart and verify.
    Valid Login Should Succeed
    Click Button       id=add-to-cart-sauce-labs-backpack
    Click Element      id=inventory_container
    Page Should Contain    Sauce Labs Backpack

Simple Checkout Start
    [Documentation]    Start checkout flow.
    Valid Login Should Succeed
    Click Button       id=add-to-cart-sauce-labs-backpack
    Click Element      id=shopping_cart_container
    Click Button       id=checkout
    Input Text         id=first-name    Gaffar
    Input Text         id=last-name     Tester
    Input Text         id=postal-code   100001
    Click Button       id=continue
    Page Should Contain    Checkout: Overview
