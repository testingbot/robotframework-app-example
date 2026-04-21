import os
import requests
from appium import webdriver
from appium.webdriver.client_config import AppiumClientConfig
from robot.libraries.BuiltIn import BuiltIn

HUB_URL = "https://hub.testingbot.com/wd/hub"
API_URL = "https://api.testingbot.com/v1/tests/{session_id}"


def _credentials():
	key = os.environ.get("TB_KEY")
	secret = os.environ.get("TB_SECRET")
	if not key or not secret:
		raise RuntimeError("TB_KEY and TB_SECRET environment variables must be set")
	return key, secret


def open_testingbot_app(options):
	key, secret = _credentials()
	client_config = AppiumClientConfig(
		remote_server_addr=HUB_URL,
		username=key,
		password=secret,
	)
	driver = webdriver.Remote(
		command_executor=HUB_URL,
		options=options,
		client_config=client_config,
	)
	appium = BuiltIn().get_library_instance("AppiumLibrary")
	appium._cache.register(driver, alias="testingbot")


def report_testingbot_status(name, status):
	key, secret = _credentials()
	appium = BuiltIn().get_library_instance("AppiumLibrary")
	session_id = appium._current_application().session_id
	payload = {"test[name]": name, "test[success]": int(status == "PASS")}
	response = requests.put(
		API_URL.format(session_id=session_id),
		data=payload,
		auth=(key, secret),
		timeout=30,
	)
	assert response.status_code == 200, response.text
