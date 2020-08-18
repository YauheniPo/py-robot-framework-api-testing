*** Settings ***
Library             OperatingSystem
Library             Collections
Library             RequestsLibrary
Library             DebugLibrary            #breakpoint keyword - Debug

Library             utils.py
Variables           constants.py


*** Variables ***
${EPAM_SYMBOL} =    EPAM
${EPAM_WEBSITE} =   http://www.epam.com
${EPAM_LONGNAME} =  EPAM Systems, Inc.


*** Keywords ***
Get_builtin_Parameter
    [Documentation]
    [Arguments]         ${key}

    ${value} =          get builtin param           ${key}
    [Return]            ${value}

Get_Auth_Headers
    [Documentation]

    ${value} =          Get_builtin_Parameter       API_KEY
    ${header} =         create dictionary           x-rapidapi-host=apidojo-yahoo-finance-v1.p.rapidapi.com
    ...                                             x-rapidapi-key=${value}
    [Return]    ${header}

Get_Params_Symbol
    [Documentation]
    [Arguments]             ${symbol}

    ${params_symbal} =      set variable                ${params_region_lang}
    Set To Dictionary       ${params_region_lang}       symbol              ${symbol}
    [Return]                ${params_symbal}

Connect_Api_YaFin
    [Documentation]

    create session          alias=api                   url=${BASE_URL}     verify=True

YaFin_Get_Request
    [Documentation]
    [Arguments]         ${alias}    ${uri}    ${params}

    ${headers} =                    Get_Auth_Headers
    ${response} =                   get request                 ${alias}     ${uri}     ${headers}    params=${params}
    should be equal as strings      ${response.status_code}     200
    [Return]                        ${response}
