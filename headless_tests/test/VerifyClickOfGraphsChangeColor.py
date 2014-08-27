from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import Select
from selenium.common.exceptions import NoSuchElementException
import unittest, time, re, os

class VerifyClickOfGraphsChangeColor(unittest.TestCase):
    def setUp(self):
        self.driver = webdriver.PhantomJS()
        self.driver.implicitly_wait(30)
        self.base_url = os.environ['TEST_BASE_URL']
	if 'http://' not in self.base_url:
		self.base_url = 'http://' + self.base_url
        if self.base_url[-1] != '/':
            self.base_url += '/'
        self.verificationErrors = []
        self.accept_next_alert = True

    def test_verify_click_of_graphs_change_color(self):
        driver = self.driver
        print "click on graph test\n"
        driver.set_window_size(1440, 900)
        driver.get(self.base_url + "login/")
        driver.find_element_by_id("id_username").clear()
        driver.find_element_by_id("id_username").send_keys("user002")
        driver.find_element_by_id("id_password").clear()
        driver.find_element_by_id("id_password").send_keys("test")
        driver.find_element_by_css_selector("button.btn-info.btn").click()
        for i in range(60):
            try:
                if self.is_element_present(By.CSS_SELECTOR, "div.heading"): break
            except: pass
            time.sleep(1)
        else: self.fail("time out")
        driver.find_element_by_xpath("//span/i").click()
        driver.find_element_by_link_text("Gender").click()
        for i in range(60):
            try:
                if self.is_element_present(By.CSS_SELECTOR, "div.bar-mask"): break
            except: pass
            time.sleep(1)
        else: self.fail("time out")
        driver.find_element_by_css_selector("div.bar-mask").click()
        driver.find_element_by_name("exclude").click()
        for i in range(60):
            try:
                if self.is_element_present(By.CSS_SELECTOR, "div.selected"): break
            except: pass
            time.sleep(1)
        else: self.fail("time out")
        driver.find_element_by_name("exclude").click()
        driver.find_element_by_link_text("user002").click()
        driver.find_element_by_link_text("Logout").click()

    def is_element_present(self, how, what):
        try: self.driver.find_element(by=how, value=what)
        except NoSuchElementException, e: return False
        return True

    def is_alert_present(self):
        try: self.driver.switch_to_alert()
        except NoAlertPresentException, e: return False
        return True

    def close_alert_and_get_its_text(self):
        try:
            alert = self.driver.switch_to_alert()
            alert_text = alert.text
            if self.accept_next_alert:
                alert.accept()
            else:
                alert.dismiss()
            return alert_text
        finally: self.accept_next_alert = True

    def tearDown(self):
        self.driver.quit()
        self.assertEqual([], self.verificationErrors)

if __name__ == "__main__":
    unittest.main()
