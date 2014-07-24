from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import Select
from selenium.common.exceptions import NoSuchElementException
import unittest, time, re

class AllConceptsArePresentVerifyTest(unittest.TestCase):
    def setUp(self):
        self.driver = webdriver.PhantomJS()
        self.driver.implicitly_wait(30)
        self.base_url = "http://0.0.0.0:8000/"
        self.verificationErrors = []
        self.accept_next_alert = True
    
    def test_all_concepts_are_present_verify(self):
        driver = self.driver
        driver.get(self.base_url + '/login/')
        driver.find_element_by_link_text("Explore OMOP Harvest").click()
        driver.find_element_by_id("id_username").clear()
        driver.find_element_by_id("id_username").send_keys("test")
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
        driver.find_element_by_link_text("Gender").click()
        driver.find_element_by_link_text("Year of Birth").click()
        driver.find_element_by_link_text("Month of Birth").click()
        driver.find_element_by_link_text("Day of Birth").click()
        driver.find_element_by_link_text("Race").click()
        driver.find_element_by_link_text("Ethnicity").click()
        driver.find_element_by_link_text("Source Gender").click()
        driver.find_element_by_link_text("Source Race").click()
        driver.find_element_by_link_text("Source Ethnicity").click()
        driver.find_element_by_xpath("//div[2]/div/div[2]/div").click()
        driver.find_element_by_link_text("Provider ID").click()
        driver.find_element_by_xpath("//div[3]/div").click()
        driver.find_element_by_link_text("Source Name").click()
        driver.find_element_by_link_text("Zip Code").click()
        driver.find_element_by_xpath("//div[4]/div").click()
        driver.find_element_by_xpath("(//a[contains(text(),'Source Name')])[2]").click()
        driver.find_element_by_css_selector("span.hidden-phone").click()
        driver.find_element_by_link_text("test").click()
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
