*** Settings ***
Library           Collections

*** Variables ***
${SUITE_LEVEL_VARIABLE}    DEFAULT_SUITE_VARIABLE

*** Test Cases ***
01-Overriding Suite-Level
    Log    ${SUITE_LEVEL_VARIABLE}
    Set Test Variable    ${SUITE_LEVEL_VARIABLE}    Value overwritten by : ${TEST_NAME}
    Log    ${SUITE_LEVEL_VARIABLE}

02
    log    ${SUITE_LEVEL_VARIABLE}

LogVariableKeywordDemo
    Log Variables

VarTypes
    ${scalar_variable}    Set Variable    abc
    @{list_variable}    Create List    a    b    c
    ${dictionary_variable}    Create Dictionary    a=1    b=2    c=3
    Comment    As variables are created is worth to check their type
    ${type}    Evaluate    type($scalar_variable)
    ${type}    Evaluate    type($list_variable)
    ${type}    Evaluate    type($dictionary_variable)
    ${type}    Evaluate    type(${scalar_variable})
    ${type}    Evaluate    type(${list_variable})
    ${type}    Evaluate    type(${dictionary_variable})

Collections
    @{list_variable}    Create List    a    b    c
    ${dictionary_variable}    Create Dictionary    a=1    b=2    c=3
    Collections.Log List    ${list_variable}    level=WARN
    Should Contain    ${list_variable}    b
    Comment    Should Contain    ${list_variable}    d    mgs=there were no d in the list
    ${dictionary_keys}    Get Dictionary Keys    ${dictionary_variable}
    ${dictionary_values}    Get Dictionary Values    ${dictionary_variable}
