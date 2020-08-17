*** Settings ***
Documentation

Resource  ..${/}resource${/}Common.robot

*** Variables ***



*** Test Cases ***
Create_Student
    [Documentation]
    [Tags]

    ${api_method} =     set variable    ${STOCK}${GET_DETAIL}
    &{params} =     create dictionary   region=US   lang=en   symbol=NBEV
    &{header} =     Get_Headers
    create session  Get_Detail  ${BASE_URL}
    ${students_response}=   get request  Get_Detail   ${api_method}    &{header}   params=&{params}
    log to console  ${students_response}
    log to console  ${students_response.text}