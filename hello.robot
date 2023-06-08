*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${TARGET}       chrome
${URL}          https://www.google.com/


*** Test Cases ***
Success with search in google with keyword=hello
    Go to google.com
    Search with keyword=hello
    Found result with hello


*** Keywords ***
Go to google.com
    Open Browser    chrome://newtab/    browser=${TARGET}
    ...    options=add_experimental_option("detach", True)
    Go To    ${URL}
    Maximize Browser Window

Search with keyword=hello
    Input Text    name:q    hello
    Press Keys    name:q    RETURN

Found result with hello
    Wait Until Page Contains    hello
