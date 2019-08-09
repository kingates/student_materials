*** Keywords ***
Search For Article In Given Language
    [Arguments]    ${phrase}    ${language}
    Wait and Click Element    //*[@class="hide-arrow"]
    Select From List By Value    //*[@id="searchLanguage"]    ${language}
    Wait and Input    //*[@id="searchInput"]    ${phrase}
    Wait And Click ELement    //*[text()='Search']

Wait And Click Element
    [Arguments]    ${selector}    ${timeout}=${TRANSITION_DELAY}
    Wait Until Element is Visible    ${selector}    ${timeout}
    Click Element    ${selector}

Wait and Input
    [Arguments]    ${selector}    ${content}    ${timeout}=${TRANSITION_DELAY}
    Wait Until Element is Visible    ${selector}    ${timeout}
    Input Text    ${selector}    ${content}
