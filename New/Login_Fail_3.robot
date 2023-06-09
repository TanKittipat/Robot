*** Settings ***
Library             SeleniumLibrary

Suite Setup         Go to login
Suite Teardown      Close Browser
Test Teardown       Back to login
Task Template       Template for login failed


*** Test Cases ***
#    Case name    |    Usernaem    |    Password
Wrong username    demo2    mode
Wrong password    demo    mode2
Wrong username and password    demo2    mode2
Empty username    ${EMPTY}    mode
Empty password    demo    ${EMPTY}


*** Keywords ***
Template for login failed
    [Arguments]    ${username}    ${password}
    Input user=${username} and password=${password}
    Login result fail and show error

Go to login
    Open Browser    https://demo-login-workshop.vercel.app/
    ...    browser=gc
    ...    options=add_experimental_option("detach", True)
    ...    remote_url=http://167.99.75.45:8080/wd/hub
    Maximize Browser Window

Back to login
    Go To    https://demo-login-workshop.vercel.app/

Input user=${username} and password=${password}
    Input Text    id:username_field    ${username}
    Input Text    id:password_field    ${password}
    Click Element    id:login_button

Login result fail and show error
    Wait Until Element Contains    xpath://*[@id="container"]/h1    Error Page
    Element Should Contain    xpath://*[@id="container"]/p    Login failed. Invalid user name and/or password.
