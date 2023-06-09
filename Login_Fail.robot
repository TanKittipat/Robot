*** Settings ***
Library     SeleniumLibrary


*** Test Cases ***
Login fail with wrong password
    [Tags]    done    feature1
    Go to login page
    Input user=demo and password=mode2
    login result fail and show error

Login fail with wrong password
    [Tags]    testing    feature1
    Go to login page
    Input user=demo2 and password=mode
    login result fail and show error

Login fail with wrong password
    [Tags]    done    feature1
    Go to login page
    Input    demo2    mode2
    login result fail and show error


*** Keywords ***
Go to login page
    Open Browser    https://demo-login-workshop.vercel.app/
    ...    browser=gc
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window

Input user=${username} and password=${password}
    Input Text    id:username_field    ${username}
    Input Text    id:password_field    ${password}
    Click Element    id:login_button

Login result fail and show error
    Wait Until Element Contains    xpath://*[@id="container"]/h1    Error Page
    Element Should Contain    xpath://*[@id="container"]/p    Login failed. Invalid user name and/or password.

Input
    [Arguments]    ${username}    ${password}
    Input Text    id:username_field    ${username}
    Input Text    id:password_field    ${password}
    Click Element    id:login_button
