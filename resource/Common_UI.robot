*** Settings ***
Library             SeleniumLibrary
Library             library.ui.steps.UIKeywords          WITH NAME       UI
Library             library.ui.common.Common             WITH NAME       COMMON_UI
Library             library.ui.symbol_page.SymbolPage    WITH NAME       SYMBOL_PAGE
Variables           library${/}ui${/}constants.py

Resource            Common.robot


*** Keywords ***
Test_Suite_Teardown
    [Documentation]

    Delete All Sessions
    Close all browsers