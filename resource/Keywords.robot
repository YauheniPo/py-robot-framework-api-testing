*** Settings ***
Resource                Common.robot


*** Keywords ***
Get_builtin_Parameter
    [Documentation]
    [Arguments]         ${key}

    ${value} =          COMMON.get builtin param    ${key}
    [Return]            ${value}

Get_Auth_Headers
    [Documentation]

    ${value} =          Get_builtin_Parameter       API_KEY
    ${header} =         create dictionary           x-rapidapi-host=apidojo-yahoo-finance-v1.p.rapidapi.com
    ...                                             x-rapidapi-key=${value}
    [Return]    ${header}

Append_To_Params
    [Documentation]
    [Arguments]             ${key}     ${value}     &{params}

    ${api_params} =         run keyword if          ${params}       set variable    ${params}
    ...                     ELSE                                    set variable    ${params_region_lang}
    Set To Dictionary       ${api_params}           ${key}          ${value}
    [Return]                ${api_params}

Connect_Api_YaFin
    [Documentation]

    create session          alias=api               url=${BASE_URL}     verify=True     disable_warnings=1

YaFin_Get_Request
    [Documentation]
    [Arguments]         ${alias}    ${uri}    ${params}

    ${headers} =                    Get_Auth_Headers
    ${response} =                   get request                 ${alias}     ${uri}     ${headers}    params=${params}
    should be equal as strings      ${response.status_code}     200          msg=Response code does not 200 OK
    [Return]                        ${response}
