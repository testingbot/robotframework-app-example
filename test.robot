*** Settings ***

Library  AppiumLibrary
Library  TestingBot
Library  AppOptions

Test Setup  Open test app
Test Teardown  Close test app

*** Test Cases ***

Simple App Test
	Wait Until Page Contains Element    //*    timeout=30s

*** Keywords ***

Open test app
	${options}=    Get App Options    ${PLATFORM}

    # W3C + Appium capabilities
    Call Method    ${options}    set_capability    platformName    ${PLATFORM}
    Call Method    ${options}    set_capability    appium:platformVersion    ${VERSION}
    Call Method    ${options}    set_capability    appium:deviceName    ${DEVICE}
    Call Method    ${options}    set_capability    appium:app    ${APP}

    # Set custom TestingBot capabilities using tb:options
    ${tb_options}=    Create Dictionary    name=Simple App Test    build=MyAppBuild
    Call Method    ${options}    set_capability    tb:options    ${tb_options}

    Open Testingbot App    ${options}

Close test app
	Report Testingbot Status    ${SUITE_NAME} | ${TEST_NAME}    ${TEST_STATUS}
	Close Application
