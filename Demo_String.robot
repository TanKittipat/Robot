*** Settings ***
Library     String


*** Variables ***
${result}       ผลการค้นหาประมาณ 67,400,000 รายการ (0.32 วินาที)


*** Test Cases ***
Try to split data
    @{words}=    Split String    ${result}    ${SPACE}    max_split=3
    Log To Console    ${words[0]}
    Log To Console    ${words[1]}
    Log To Console    ${words[2]}
    Log To Console    ${words[3]}
    Should Be Equal    ${words[0]}    ผลการค้นหาประมาณ
    Should Be Equal    ${words[2]}    รายการ
    Should End With    ${words[0]}    ณ
