*** Settings ***
Library    SeleniumLibrary
Resource    variables.robot

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Implicit Wait    10s

Input Credentials
    [Arguments]    ${username}    ${password}
    Input Text    xpath=//input[@name="username"]    ${username}
    Input Text    xpath=//input[@name="password"]    ${password}
    Click Button    xpath=//button[@type="submit"]

Click Login Button
    Click Button    xpath=//button[@type="submit"]

Logout
    Click Element    xpath=//span[@class="oxd-userdropdown-tab"]
    Click Element    xpath=//a[text()="Logout"]

Verify Profile Name
    ${profile_name}=    Get Text    xpath=//p[@class="oxd-userdropdown-name"]
    Should Be Equal As Strings    ${profile_name}    Paul Collings

Verify Dashboard Page
    Page Should Contain Element    xpath=//h6[text()="Dashboard"]
    Location Should Contain    /dashboard

Verify My Info Page
    Click Element    xpath=//span[text()="My Info"]
    Wait Until Page Contains Element    xpath=//h6[text()="Personal Details"]    timeout=5s
    Location Should Contain    /pim/viewPersonalDetails
