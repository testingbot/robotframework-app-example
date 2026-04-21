from appium.options.android import UiAutomator2Options
from appium.options.ios import XCUITestOptions


def get_app_options(platform):
	if platform.lower() == "android":
		return UiAutomator2Options()
	elif platform.lower() == "ios":
		return XCUITestOptions()
	else:
		raise ValueError(f"Unsupported platform: {platform}")
