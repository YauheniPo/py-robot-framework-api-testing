*** Settings ***
Library             SeleniumLibrary
Library             ui.steps.UIKeywords          WITH NAME       UI
Library             ui.common.Common             WITH NAME       COMMON_UI
Library             ui.symbol_page.SymbolPage    WITH NAME       SYMBOL_PAGE
Variables           ui${/}constants.py

Resource            Common.robot


*** Keywords ***
Test_Suite_Teardown
    [Documentation]

    Delete All Sessions
    Close all browsers