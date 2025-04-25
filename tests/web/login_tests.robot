*** Settings ***
Resource    ../resources/web_keywords.robot

*** Test Cases ***
Valid Login Should Succeed
    Open Browser To Login Page
    Login With Credentials    user1    pass123
    Page Should Contain    Welcome
