*** Settings ***
Library     RequestsLibrary
Library     OperatingSystem
Library     parameters.Param        WITH NAME   PARAM
Resource    API Resource.robot


*** Variables ***


*** Keywords ***
Get_API_Key
    [Documentation]

    ${key} =    PARAM.Get Env Param   API_KEY
    log to console  ${key}

    [Return]    ${key}

Get_Headers
    [Documentation]

    ${api_key} =    Get_API_Key
    [Return]    ${api_key}
