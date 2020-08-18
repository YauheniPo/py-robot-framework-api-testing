*** Settings ***
#robot  --pythonpath Resources -d Results/  -v API_KEY:e212b4225fmshed411aea23361d9p1df34bjsn46dcf30143ef Tests/Yauhoo-Finance-Tests.robot
Documentation

Resource  .${/}Common.robot

Suite Setup          Connect_Api_YaFin


*** Variables ***



*** Test Cases ***
Check_Yahoo_Finance_Detail
    [Documentation]
    [Tags]

    ${stock-detail} =           set variable            ${STOCK}${GET_DETAIL}
    ${params} =                 Get_Params_Symbol       EPAM
    ${response} =               YaFin_Get_Request       api                    ${stock-detail}    ${params}
    run keyword and continue on failure                 SHOULD BE EQUAL AS STRINGS
    ...                         ${response.json()['symbol']}                        ${EPAM_SYMBOL}
    run keyword and continue on failure                 SHOULD BE EQUAL AS STRINGS
    ...                         ${response.json()['summaryProfile']['website']}     ${EPAM_WEBSITE}
    run keyword and continue on failure                 SHOULD BE EQUAL AS STRINGS
    ...                         ${response.json()['quoteType']['longName']}         ${EPAM_LONGNAME}