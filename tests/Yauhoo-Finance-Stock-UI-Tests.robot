*** Settings ***
Documentation

Resource            ..${/}resource${/}Common_UI.robot

Suite Setup         Connect_Api_YaFin
Suite Teardown      Test_Suite_Teardown


*** Variables ***
${BROWSER}          Firefox


*** Test Cases ***
Check_Yahoo_Finance_Summary_Detail_With_UI
    [Documentation]

    ${api_summary_detail_dict}  ${api_long_name}  ${symbol} =
    ...                                     Get_Summary_Detail_Api      ${EPAM_SYMBOL}
    Open_Browser_Symbol_URL                 ${EPAM_SYMBOL}
    ${symbol_ui} =                          SYMBOL_PAGE.fetch symbol ui
    ${page_symbol_title} =                  SYMBOL_PAGE.get symbol title
    ${symbol_ui.title} =                    set variable                ${page_symbol_title}
    Validate Summary Detail                 ${symbol_ui}
    ...                                     ${api_summary_detail_dict}
    ...                                     ${api_long_name}
    ...                                     ${symbol}

*** Keywords ***
Get_Summary_Detail_Api
    [Documentation]
    [Arguments]                         ${symbol}

    ${params} =                         Append_To_Params            symbol      ${symbol}               ${params_region}
    ${stock-v2-summary} =               set variable                ${STOCK}${V2}${GET_SUMMARY}
    ${response} =                       YaFin_Get_Request           api         ${stock-v2-summary}     ${params}
    [Return]                            ${response.json()['summaryDetail']}
    ...                                 ${response.json()['quoteType']['longName']}
    ...                                 ${response.json()['symbol']}

Validate Summary Detail
    [Documentation]
    [Arguments]                             ${symbol_ui}                ${api_summary_detail_dict}
    ...                                     ${api_long_name}            ${symbol}

    ${symbol_title} =                       format string               ${SYMBOL_TITLE_TEMPLATE}
    ...                                                                 ${api_long_name}    ${symbol}
    SOFT.should be equal as strings         ${symbol_ui.title}          ${symbol_title}
    :FOR    ${key}   ${value}    IN     &{SUMMARY_UI_API_MATCHER}
    \   ${value} =      set variable        ${SUMMARY_UI_API_MATCHER}[${key}]
    \   debug
    \   SOFT.should be equal as strings     ${symbol_ui.${value}}       ${api_summary_detail_dict['${value}']['fmt']}

Get_UI_Symbol_URL
    [Documentation]
    [Arguments]                 ${symbol}

    ${symbol_url_template} =    set variable        ${YAHOO_FINANCE_SITE}${QUOTE_SEARCH_TEMPLATE}
    ${symbol_url} =             format string       ${symbol_url_template}       ${symbol}
    [Return]                    ${symbol_url}

Open_Browser_URL
    [Documentation]
    [Arguments]                 ${url}

    Open Browser                ${url}              ${BROWSER}
    log to console              COMMON_UI.get driver session id
    Maximize Browser Window

Open_Browser_Symbol_URL
    [Documentation]
    [Arguments]                 ${symbol}

    ${symbol_url} =             Get_UI_Symbol_URL   ${symbol}
    Open_Browser_URL            ${symbol_url}
    Set Selenium Implicit Wait  10 seconds
    Wait For Condition          return document.readyState=="complete"
