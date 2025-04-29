*** Settings ***
Resource    ../../resources/web_keywords.robot

Suite Setup    Open Browser To Login Page
Suite Teardown    Close Browser

*** Test Cases ***
Successful Login
    Input Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Wait Until Page Contains Element    xpath=//h6[text()="Dashboard"]    timeout=10s
    Page Should Contain    Dashboard

Invalid Login
    Input Credentials    ${INVALID_USERNAME}    ${INVALID_PASSWORD}
    Wait Until Page Contains Element    xpath=//p[contains(@class,"oxd-alert-content-text")]    timeout=5s
    Page Should Contain    Invalid credentials

Empty Username and Password
    Click Button    xpath=//button[@type="submit"]
    Wait Until Page Contains Element    xpath=//span[text()="Required"]    timeout=5s
    Page Should Contain    Required

Logout After Successful Login
    Input Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Wait Until Page Contains Element    xpath=//h6[text()="Dashboard"]    timeout=10s
    Logout
    Wait Until Page Contains Element    xpath=//button[@type="submit"]    timeout=5s
    Page Should Contain Element    xpath=//button[@type="submit"]
