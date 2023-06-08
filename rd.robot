*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${TARGET}       chrome
${URL}          https://efiling.rd.go.th/rd-cms/


*** Test Cases ***
Flow การยื่นแบบภาษี
    Go to efilling Page
    Read information
    View service detail
    Start e-filling process


*** Keywords ***
Go to efilling Page
    Open Browser    chrome://newtab/    browser=${TARGET}
    ...    options=add_experimental_option("detach", True)
    Go To    ${URL}
    Maximize Browser Window

Read information
    Wait Until Element Is Visible    id:exampleModalLabel
    # Open Information
    Click Element    xpath=//*[@id="announceModal"]/div/div/div[2]/div/div[2]/span/a

View service detail
    Switch Window    NEW
    Wait Until Element Contains    xpath=//div/div[2]/h4[3]
    ...    ช่วงเวลาการให้บริการของแต่ละช่องทาง

Start e-filling process
    Switch Window    MAIN
    # Close Popup
    Click Element    xpath=//*[@id="announceModal"]/div/div/div[1]/button
    Click Element    xpath=//*[@id="top"]/div/div[2]/button[1]/a
