*** Settings ***
Resource    ../resources/web_keywords.robot

Suite Setup    Open Browser To Login Page
Suite Teardown    Close Browser

*** Test Cases ***
Verify Profile Name After Login
    Input Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Verify Profile Name

Verify Dashboard After Login
    Input Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Verify Dashboard Page

Verify My Info Page
    Input Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Verify My Info Page
