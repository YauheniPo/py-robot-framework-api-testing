*** Settings ***
Documentation

Resource            ..${/}resource${/}Common.robot

Suite Setup         Connect_Api_YaFin
Suite Teardown      Delete All Sessions

Test Template       Check_Yahoo_Finance_Quotes

*** Variables ***



*** Test Cases ***
#                                   symbol
Check_Yahoo_Finance_Quotes_EPAM     ${EPAM_SYMBOL}
Check_Yahoo_Finance_Quotes_APPLE    ${APPLE_SYMBOL}


*** Keywords ***
Check_Yahoo_Finance_Quotes
    [Documentation]
    [Arguments]                 ${symbol}

    ${market-quotes} =          set variable            ${MARKET}${GET_QUOTES}
    ${params} =                 Append_To_Params        symbols                     ${symbol}
    ${response} =               YaFin_Get_Request       api                         ${market-quotes}    ${params}
    SOFT.SHOULD BE EQUAL AS STRINGS
    ...                         ${response.json()['quoteResponse']['result'][0]['symbol']}     ${symbol}
    SOFT.SHOULD BE TRUE         ${response.json()['quoteResponse']['result'][0]['regularMarketPrice']}
