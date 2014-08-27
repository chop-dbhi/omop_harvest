from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import Select
from selenium.common.exceptions import NoSuchElementException
import unittest, time, re
import os

class VerifyPersonExistsResultsVisible(unittest.TestCase):

    def setUp(self):
        self.path = os.path.dirname(os.path.realpath(__file__))
        self.driver = webdriver.PhantomJS()
        self.driver.implicitly_wait(30)
        self.base_url = os.environ['TEST_BASE_URL']
	if 'http://' not in self.base_url:
		self.base_url = 'http://' + self.base_url
        if self.base_url[-1] != '/':
            self.base_url += '/'
        self.verificationErrors = []
        self.accept_next_alert = True

    def test_verify_person_exists_results_visible(self):
        driver = self.driver
        driver.set_window_size(2000, 1500)
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
        driver.find_element_by_css_selector("div.heading").click()
        driver.find_element_by_link_text("Person ID").click()
        for i in range(60):
            try:
                if self.is_element_present(By.CSS_SELECTOR, "div.value-item"): break
            except: pass
            time.sleep(1)
        else: self.fail("time out")
        driver.save_screenshot(self.path + '/screenshots/VerifyPersonExistsResultsVisible.png')
        driver.find_element_by_xpath("//div[@id='c1f1']/div[4]/div/div/div/div/div/div[3]/div/div/div/div/button").click()
        driver.find_element_by_xpath("//div[@id='c1f1']/div[4]/div/div/div/div/div/div[3]/div/div/div[2]/div/button").click()
        driver.find_element_by_xpath("//div[@id='c1f1']/div[5]/button[2]").click()
        driver.save_screenshot(self.path + '/screenshots/VerifyPersonExistsResultsVisible.png')
        for i in range(60):
            try:
                if self.is_element_present(By.CSS_SELECTOR, "div[data-target=\"description\"]"): break
            except: pass
            time.sleep(1)
        else: self.fail("time out")
        driver.find_element_by_xpath("//div[@id='context-panel']/div/div[3]/div/button[2]").click()
        driver.save_screenshot(self.path + '/screenshots/VerifyPersonExistsResultsVisible.png')
        for i in range(60):
            try:
                if self.is_element_present(By.CSS_SELECTOR, "table.table-striped"): break
            except: pass
            time.sleep(1)
        else: self.fail("time out")
        driver.find_element_by_link_text("Query").click()
        for i in range(60):
            try:
                if self.is_element_present(By.CSS_SELECTOR, "div[data-target=\"description\"]"): break
            except: pass
            time.sleep(1)
        else: self.fail("time out")
        for i in range(60):
            try:
                if self.is_element_present(By.CSS_SELECTOR, "button[data-action=\"remove\"]"): break
            except: pass
            time.sleep(1)
        else: self.fail("time out")
        driver.save_screenshot(self.path + '/screenshots/VerifyPersonExistsResultsVisible.png')
        driver.find_element_by_xpath("//div[@id='context-panel']/div/div/div/div/button").click()
        driver.find_element_by_xpath("//div[@id='c1f1']/div[4]/div/div/div/div/div/div[3]/div/div/div/div/button[2]").click()
        driver.find_element_by_xpath("//div[@id='c1f1']/div[4]/div/div/div/div/div/div[3]/div/div/div[2]/div/button[2]").click()
        driver.save_screenshot(self.path + '/screenshots/VerifyPersonExistsResultsVisible.png')
        driver.find_element_by_link_text("user002").click()
        driver.find_element_by_link_text("Logout").click()
        driver.save_screenshot(self.path + '/screenshots/VerifyPersonExistsResultsVisible.png')

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
