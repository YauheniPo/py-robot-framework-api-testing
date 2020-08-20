*** Settings ***
#robot  --pythonpath library -d results/  -v API_KEY:<key> tests/Yauhoo-Finance-*.robot
#pabot --processes 4 --pythonpath library -d results/  -v API_KEY:<key> tests/Yauhoo-Finance-*.robot
Library             OperatingSystem
Library             Collections
Library             RequestsLibrary
Library             DebugLibrary            #breakpoint keyword - Debug

Library             utils.common.Common                 WITH NAME   COMMON
Library             utils.json_reader.ConfigReader      WITH NAME   JSON
Library             utils.soft_assert.SoftAssert        WITH NAME   SOFT
Variables           api${/}constants.py
Variables           yahoo-finance${/}constants.py

Resource            Keywords.robot