*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Keywords ***
Create Session
    Create Session    json_api    ${BASE_URL}

Get User Details
    [Arguments]    ${user_id}
    ${response}=    GET    json_api    /users/${user_id}
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.json()}
