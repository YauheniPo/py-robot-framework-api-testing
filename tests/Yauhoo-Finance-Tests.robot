*** Settings ***
#robot  --pythonpath resources -d results/  -v API_KEY:e212b4225fmshed411aea23361d9p1df34bjsn46dcf30143ef tests/Yauhoo-Finance-Tests.robot
Documentation

Resource            .${/}Common.robot

Suite Setup         Connect_Api_YaFin
Suite Teardown      Delete All Sessions

Test Template       Check_Yahoo_Finance_Quotes

*** Variables ***



*** Test Cases ***
Yahoo_Finance_Detail
    [Template]         Check_Yahoo_Finance_Detail ${symbol} / ${website} / ${longname}
#   symbol             website             longname
    ${EPAM_SYMBOL}     ${EPAM_WEBSITE}     ${EPAM_LONGNAME}
    ${APPLE_SYMBOL}    ${APPLE_WEBSITE}    ${APPLE_LONGNAME}

#                                   symbol
Check_Yahoo_Finance_Quotes_EPAM     ${EPAM_SYMBOL}
Check_Yahoo_Finance_Quotes_APPLE    ${APPLE_SYMBOL}

*** Keywords ***
Check_Yahoo_Finance_Detail ${symbol} / ${website} / ${longname}
    [Documentation]

    ${stock-detail} =           set variable            ${STOCK}${GET_DETAIL}
    ${params} =                 Append_To_Params        symbol                      ${symbol}
    ${response} =               YaFin_Get_Request       api                         ${stock-detail}    ${params}
    run keyword and continue on failure                 SHOULD BE EQUAL AS STRINGS
    ...                         ${response.json()['symbol']}                        ${symbol}
    run keyword and continue on failure                 SHOULD BE EQUAL AS STRINGS
    ...                         ${response.json()['summaryProfile']['website']}     ${website}
    run keyword and continue on failure                 SHOULD BE EQUAL AS STRINGS
    ...                         ${response.json()['quoteType']['longName']}         ${longname}


Check_Yahoo_Finance_Quotes
    [Documentation]
    [Arguments]                 ${symbol}

    ${market-quotes} =          set variable            ${MARKET}${GET_QUOTES}
    ${params} =                 Append_To_Params        symbols                     ${symbol}
    ${response} =               YaFin_Get_Request       api                         ${market-quotes}    ${params}
    run keyword and continue on failure                 SHOULD BE EQUAL AS STRINGS
    ...                         ${response.json()['quoteResponse']['result'][0]['symbol']}     ${symbol}
    run keyword and continue on failure                 should be true
    ...                         ${response.json()['quoteResponse']['result'][0]['regularMarketPrice']}