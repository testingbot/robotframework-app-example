*** Settings ***

Library  AppiumLibrary
Library  TestingBot
Library  AppOptions

Test Setup  Open test app
Test Teardown  Close test app

*** Test Cases ***

iOS Sample App Sum Test
	Wait Until Page Contains Element    accessibility_id=inputA    timeout=30s
	Input Text    accessibility_id=inputA    10
	Wait Until Page Contains Element    accessibility_id=inputB    timeout=30s
	Input Text    accessibility_id=inputB    5

*** Keywords ***

Open test app
	${options}=    Get App Options    iOS

    # W3C + Appium capabilities for a TestingBot iOS simulator
    Call Method    ${options}    set_capability    platformName    iOS
    Call Method    ${options}    set_capability    appium:deviceName    iPhone.*
    Call Method    ${options}    set_capability    appium:platformVersion    26.0
    Call Method    ${options}    set_capability    appium:automationName    XCUITest
    Call Method    ${options}    set_capability    appium:app    https://testingbot.com/appium/sample.zip

    # Set custom TestingBot capabilities using tb:options
    ${tb_options}=    Create Dictionary    name=iOS Simulator App Test    build=MyAppBuild
    Call Method    ${options}    set_capability    tb:options    ${tb_options}

    Open Testingbot App    ${options}

Close test app
	Report Testingbot Status    ${SUITE_NAME} | ${TEST_NAME}    ${TEST_STATUS}
	Close Application
