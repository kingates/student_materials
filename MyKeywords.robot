*** Test Cases ***
ClassicalKeywords
    ${var1}=    Multiply Integer by 2    4
    ${var2}=    Multiply Integer by 2 but differently    ${var1}
    ${var3}=    Multiply two given variables    ${var1}    ${var2}
    @{list}=    Create List    3    4
    ${var4}=    Multiply two given variables    @{list}
    &{dict}=    Create Dictionary    3=abc    6=SetMultiplydef
    ${var5}=    Multiply two given variables    @{dict}
    ${var6}=    Multiply two given variables    3    3    3
    Take "TEST" and log it with WARN level

IfStatements
    ${var1}=    Multiply Integer by 2    4
    ${Log}=    Set Variable If    ${var1} < 7    Variable is lesser than 7    Variable is greater than 7
    Log    ${Log}
    ###
    @{list}    Create List    @{EMPTY}
    ${Log} =    Set Variable If    ${list}    List is non-empty    List is empty
    Log    ${Log}
    ###
    ${var1} =    Multiply Integer by 2 and resert if over 8    ${var1}
    ${var1} =    Multiply Integer by 2 and resert if over 8    ${var1}

*** Keywords ***
Multiply Integer by 2 and resert if over 8
    [Arguments]    ${var1}
    ${var1} =    Run Keyword If    ${var1} == 8    Multiply Integer by 2    ${var1}
    ...    ELSE    Set Variable    0
    ${log_level}    Set Variable If    ${var1} == 0    WARN    INFO
    Log    ${var1}    level=${log_level}
    [Return]    ${var1}

Multiply Integer by 2
    [Arguments]    ${input_integer}
    ${converted_input}=    Convert To Integer    ${input_integer}
    ${output}=    Evaluate    ${converted_input} * 2
    Return From Keyword    ${output}

Multiply Integer by 2 but differently
    [Arguments]    ${input_integer}
    ${converted_input}=    Convert To Integer    ${input_integer}
    ${output}=    Evaluate    ${converted_input} * 2
    [Return]    ${output}

Multiply two given variables
    [Arguments]    ${input_integer1}    ${input_integer2}    ${input_integer3}=1
    ${converted_input1}=    Convert To Integer    ${input_integer1}
    ${converted_input2}=    Convert To Integer    ${input_integer2}
    ${converted_input3}=    Convert To Integer    ${input_integer3}
    ${output}=    Evaluate    ${converted_input1} * ${converted_input2}* ${converted_input3}
    [Return]    ${output}

Create custom list
    [Arguments]    @{args}
    [Return]    @{args}

Take "${some_string_variable}" and log it with ${level} level
    Log    ${some_string_variable}    level=${level}
