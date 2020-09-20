*** Settings ***
#robot --pythonpath . -d results/ -v BROWSER:headlessfirefox -v API_KEY:<key> tests/Yauhoo-Finance-*.robot
#pabot --processes 10 --pythonpath . -d results/ -v BROWSER:headlessfirefox -v API_KEY:<key> tests/Yauhoo-Finance-*.robot
Library             OperatingSystem
Library             Collections
Library             RequestsLibrary
Library             DebugLibrary            #breakpoint keyword - Debug
Library             SeleniumLibrary
Library             StringFormat

Library             library.utils.common.Common                 WITH NAME   COMMON
Library             library.utils.json_reader.ConfigReader      WITH NAME   JSON
Library             library.utils.soft_assert.SoftAssert        WITH NAME   SOFT
Variables           library${/}api${/}constants.py
Variables           library${/}ui${/}constants.py
Variables           library${/}yahoo-finance${/}constants.py

Resource            Keywords.robot