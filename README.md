[![Validate RobotFramework App Example](https://github.com/testingbot/robotframework-app-example/actions/workflows/test-python.yml/badge.svg)](https://github.com/testingbot/robotframework-app-example/actions/workflows/test-python.yml)

## TestingBot RobotFramework Appium Example

TestingBot provides an online grid of real devices and emulators/simulators to run automated native app tests on via Appium.
This example demonstrates how to use RobotFramework together with [AppiumLibrary](https://docs.robotframework.org/docs/different_libraries/appium) to run a native mobile app test on a remote TestingBot device.

### Environment Setup

1. Setup
    * Clone the repo
    * Install the dependencies `pip install -r requirements.txt`

2. TestingBot Credentials

   Retrieve your TestingBot Key and Secret from the [TestingBot Dashboard](https://testingbot.com/members/) and export them as environment variables:

   ```
   export TB_KEY=<your TestingBot Key>
   export TB_SECRET=<your TestingBot Secret>
   ```

3. Upload your app

   Upload your `.apk` or `.ipa` to TestingBot (or host it on a public URL). See [TestingBot App Automate](https://testingbot.com/support/app-automate/help).

4. Run test:

    Android Physical Device example:
    ```
    PYTHONPATH=$PYTHONPATH:. robot test_android_physical.robot
    ```

    Android Emulator example:
    ```
    PYTHONPATH=$PYTHONPATH:. robot test_android_emulator.robot
    ```

    iOS Physical Device example:
    ```
    PYTHONPATH=$PYTHONPATH:. robot test_ios_physical.robot
    ```

    iOS Simulator example:
    ```
    PYTHONPATH=$PYTHONPATH:. robot test_ios_simulator.robot
    ```


### Resources
##### [TestingBot Documentation](https://testingbot.com/support/app-automate)

##### [AppiumLibrary Documentation](https://docs.robotframework.org/docs/different_libraries/appium)

##### [RobotFramework Documentation](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)
