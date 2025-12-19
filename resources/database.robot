*** Settings ***
Library    DatabaseLibrary

*** Variables ***
${DB_API}       pymysql
${DB_NAME}      pyrobotrpa
${DB_USER}      robotuser
${DB_PASSWORD}  RobotPass123!
${DB_HOST}      127.0.0.1
${DB_PORT}      3306

*** Keywords ***
Connect To Test DB
    Connect To Database    ${DB_API}    ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}

Order Count For User Should Be
    [Arguments]    ${username}    ${expected}
    Connect To Test DB
    ${rows}=    Query    SELECT COUNT(*) FROM orders WHERE username='${username}'
    ${actual}=    Set Variable    ${rows[0][0]}
    Should Be Equal As Integers    ${actual}    ${expected}
    Disconnect From Database


Insert Order Row
    [Arguments]    ${username}    ${product}    ${quantity}
    Connect To Test DB
    ${sql}=    Catenate    INSERT INTO orders (username, product, quantity) VALUES ('${username}', '${product}', ${quantity})
    Execute Sql String    ${sql}
    Log To Console    Inserted order for ${username}, product=${product}, qty=${quantity}
    Disconnect From Database


Get All Orders
    Connect To Test DB
    ${rows}=    Query    SELECT * FROM orders
    Log    All orders: ${rows}
    Log To Console    Retrieved ${len(${rows})} total orders
    Disconnect From Database

Get Orders By Product
    [Arguments]    ${product}
    Connect To Test DB
    ${rows}=    Query    SELECT * FROM orders WHERE product='${product}'
    Log    Orders for ${product}: ${rows}
    Log To Console    Found ${len(${rows})} orders for ${product}
    Disconnect From Database