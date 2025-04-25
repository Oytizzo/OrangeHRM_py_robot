*** Settings ***
Resource    ../resources/api_keywords.robot

*** Test Cases ***
Verify Valid User API
    Create Session
    Get User Details    1
