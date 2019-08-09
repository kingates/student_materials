*** Settings ***
Library           Collections

*** Test Cases ***
CombinationsUsingRFSyntax
    @{lowercase}=    Create List    a    b    c
    @{uppercase}=    Create List    A    B    C
    @{numbers}=    Create List    1    2    3
    ${temp}=    Create combination of two lists    ${lowercase}    ${uppercase}
    ${output}=    Create combination of two lists    ${temp}    ${numbers}
    Log list    ${output}

CombinationsUsingPython
    @{lowercase}=    Create List    a    b    c
    @{uppercase}=    Create List    A    B    C
    @{numbers}=    Create List    1    2    3
    ${output}=    Evaluate    [a+b+c for a in ${lowercase} for b in ${uppercase} for c in ${numbers}]
    Log list    ${output}

*** Keywords ***
Append Prefix to every item on the list
    [Arguments]    ${prefix}    ${list}
    @{output}=    Create List    @{EMPTY}
    : FOR    ${item}    IN    @{list}
    \    Log    ${item}
    \    Append to List    ${output}    ${prefix}${item}
    [Return]    ${output}

Create combination of two lists
    [Arguments]    ${list1}    ${list2}
    @{output}    Create List    @{EMPTY}
    : FOR    ${item}    IN    @{list1}
    \    ${tmp}=    Append Prefix to every item on the list    ${item}    ${list2}
    \    Append To List    ${output}    @{tmp}
    [Return]    ${output}
