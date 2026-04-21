*** Settings ***

Library  AppiumLibrary
Library  TestingBot
Library  AppOptions

Test Setup  Open test app
Test Teardown  Close test app

*** Test Cases ***

Android Sample App Sum Test
	Wait Until Page Contains Element    accessibility_id=inputA    timeout=30s
	Input Text    accessibility_id=inputA    10
	Wait Until Page Contains Element    accessibility_id=inputB    timeout=30s
	Input Text    accessibility_id=inputB    5
	Wait Until Page Contains Element    accessibility_id=sum    timeout=30s
	Element Text Should Be    accessibility_id=sum    15

*** Keywords ***

Open test app
	${options}=    Get App Options    Android

    # W3C + Appium capabilities for a TestingBot Android real device
    Call Method    ${options}    set_capability    platformName    Android
    Call Method    ${options}    set_capability    appium:deviceName    Pixel.*
    Call Method    ${options}    set_capability    appium:platformVersion    16.0
    Call Method    ${options}    set_capability    appium:automationName    UiAutomator2
    Call Method    ${options}    set_capability    appium:app    https://testingbot.com/appium/sample.apk

    # Set custom TestingBot capabilities using tb:options
    ${tb_options}=    Create Dictionary    name=Android Physical App Test    build=MyAppBuild    realDevice=True
    Call Method    ${options}    set_capability    tb:options    ${tb_options}

    Open Testingbot App    ${options}

Close test app
	Report Testingbot Status    ${SUITE_NAME} | ${TEST_NAME}    ${TEST_STATUS}
	Close Application
