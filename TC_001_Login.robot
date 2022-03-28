*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url}    https://api.dev-genesis.lionparcel.com
${email}    conscgksu
${password}    Genesis123

*** Test Cases ***
AuthTest
    create session    mysession    ${base_url}
    ${body}=    Create Dictionary    email=conscgksu    password=Genesis123
    ${header}=    Create Dictionary    Content-Type=application/json
    ${response}=    POST Request    mysession    /horde/v1/auth/login  data=${body}     headers=${header} 
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}

    Should Be Equal As Strings    ${response.status_code}    200