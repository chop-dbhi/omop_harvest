from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import Select
from selenium.common.exceptions import NoSuchElementException
import unittest, time, re

class VerifyPersonConceptData(unittest.TestCase):
    def setUp(self):
        self.driver = webdriver.PhantomJS()
        self.driver.implicitly_wait(30)
        self.base_url = "http://0.0.0.0:8000/"
        self.verificationErrors = []
        self.accept_next_alert = True
    
    def test_verify_person_concept_data(self):
        driver = self.driver
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
        driver.find_element_by_xpath("//div[@id='c1f1']/div[4]/div/div/div/div/div/div[3]/div/div/div/div/button").click()
        driver.find_element_by_xpath("//div[@id='c1f1']/div[5]/button[2]").click()
        driver.find_element_by_link_text("Gender").click()
        for i in range(60):
            try:
                if self.is_element_present(By.CSS_SELECTOR, "div.bar-mask"): break
            except: pass
            time.sleep(1)
        else: self.fail("time out")
        driver.find_element_by_css_selector("div.bar-mask").click()
        driver.find_element_by_xpath("//div[@id='c85f81']/div[5]/button[2]").click()
        driver.find_element_by_link_text("Year of Birth").click()
        for i in range(60):
            try:
                if self.is_element_present(By.CSS_SELECTOR, "div.chart"): break
            except: pass
            time.sleep(1)
        else: self.fail("time out")
        driver.find_element_by_link_text("Month of Birth").click()
        for i in range(60):
            try:
                if self.is_element_present(By.CSS_SELECTOR, "div.chart"): break
            except: pass
            time.sleep(1)
        else: self.fail("time out")
        driver.find_element_by_link_text("Day of Birth").click()
        for i in range(60):
            try:
                if self.is_element_present(By.CSS_SELECTOR, "div.chart"): break
            except: pass
            time.sleep(1)
        else: self.fail("time out")
        driver.find_element_by_link_text("Race").click()
        for i in range(60):
            try:
                if self.is_element_present(By.CSS_SELECTOR, "div.bar-mask"): break
            except: pass
            time.sleep(1)
        else: self.fail("time out")
        driver.find_element_by_css_selector("div.bar-mask").click()
        driver.find_element_by_xpath("//div[@id='c93f89']/div[5]/button[2]").click()
        driver.find_element_by_link_text("Ethnicity").click()
        for i in range(60):
            try:
                if self.is_element_present(By.CSS_SELECTOR, "div.bar-mask"): break
            except: pass
            time.sleep(1)
        else: self.fail("time out")
        driver.find_element_by_css_selector("div.bar-mask").click()
        driver.find_element_by_xpath("//div[@id='c101f97']/div[5]/button[2]").click()
        driver.find_element_by_link_text("Source Gender").click()
        for i in range(60):
            try:
                if self.is_element_present(By.CSS_SELECTOR, "div.bar-mask"): break
            except: pass
            time.sleep(1)
        else: self.fail("time out")
        driver.find_element_by_css_selector("div.bar-mask").click()
        driver.find_element_by_xpath("//div[@id='c6f6']/div[5]/button[2]").click()
        driver.find_element_by_link_text("Source Race").click()
        for i in range(60):
            try:
                if self.is_element_present(By.CSS_SELECTOR, "div.bar-mask"): break
            except: pass
            time.sleep(1)
        else: self.fail("time out")
        driver.find_element_by_css_selector("div.bar-mask").click()
        driver.find_element_by_xpath("//div[@id='c7f7']/div[5]/button[2]").click()
        driver.find_element_by_link_text("Source Ethnicity").click()
        for i in range(60):
            try:
                if self.is_element_present(By.CSS_SELECTOR, "div.bar-mask"): break
            except: pass
            time.sleep(1)
        else: self.fail("time out")
        driver.find_element_by_css_selector("div.bar-mask").click()
        driver.find_element_by_xpath("//div[@id='c8f8']/div[5]/button[2]").click()
        driver.find_element_by_xpath("//div[@id='context-panel']/div/div/div/div/button").click()
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
