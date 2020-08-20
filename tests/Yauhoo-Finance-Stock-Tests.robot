*** Settings ***
Documentation

Resource            ..${/}resource${/}Common.robot

Suite Setup         Connect_Api_YaFin
Suite Teardown      Delete All Sessions


*** Variables ***



*** Test Cases ***
Check_Yahoo_Finance_Detail
    [Template]         Check_Yahoo_Finance_Detail ${symbol} / ${website} / ${longname}
#   symbol             website             longname
    ${EPAM_SYMBOL}     ${EPAM_WEBSITE}     ${EPAM_LONGNAME}
    ${APPLE_SYMBOL}    ${APPLE_WEBSITE}    ${APPLE_LONGNAME}


Check_Yahoo_Finance_Quote_Type
    [Template]         Check_Yahoo_Finance_Quote_Type ${symbol}
#   symbol
    ${EPAM_SYMBOL}
    ${APPLE_SYMBOL}

*** Keywords ***
Check_Yahoo_Finance_Detail ${symbol} / ${website} / ${longname}
    [Documentation]

    ${stock-detail} =           set variable            ${STOCK}${GET_DETAIL}
    ${params} =                 Append_To_Params        symbol                      ${symbol}
    ${response} =               YaFin_Get_Request       api                         ${stock-detail}    ${params}
    SOFT.SHOULD BE EQUAL AS STRINGS
    ...                         ${response.json()['symbol']}                        ${symbol}
    SOFT.SHOULD BE EQUAL AS STRINGS
    ...                         ${response.json()['summaryProfile']['website']}     ${website}
    SOFT.SHOULD BE EQUAL AS STRINGS
    ...                         ${response.json()['quoteType']['longName']}         ${longname}


Check_Yahoo_Finance_Quote_Type ${symbol}
    [Documentation]

    ${params} =                     create dictionary           symbol=${symbol}
    ${stock-v2-analysis} =          set variable                ${STOCK}${V2}${GET_ANALYSIS}
    ${response} =                   YaFin_Get_Request           api         ${stock-v2-analysis}    ${params}
    ${response_quote_type_dict} =   set variable                ${response.json()['quoteType']}
    ${quote_type_obj} =             JSON.get quote type from json           ${symbol}
    ${quote_type_obj_dict} =        set variable                ${quote_type_obj.__dict__}
    dictionaries should be equal    ${quote_type_obj_dict}      ${response_quote_type_dict}
    ...                             msg=Quote Type data block does not correct
