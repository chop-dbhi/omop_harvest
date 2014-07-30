from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.common.exceptions import NoSuchElementException
import unittest, time, re


class VerifyPersonExistsResultsVisible(unittest.TestCase):
    def setUp(self):
        self.driver = webdriver.PhantomJS()
        self.driver.implicitly_wait(30)
        self.base_url = "http://0.0.0.0:8000/"
        self.verificationErrors = []
        self.accept_next_alert = True

    def test_verify_person_exists_results_visible(self):
        driver = self.driver
        driver.get(self.base_url + "login/")
        driver.find_element_by_id("id_username").clear()
        driver.find_element_by_id("id_username").send_keys("user002")
        driver.find_element_by_id("id_password").clear()
        driver.find_element_by_id("id_password").send_keys("chopchop")
        driver.find_element_by_css_selector("button.btn-info.btn").click()
        for i in range(60):
            try:
                if self.is_element_present(By.CSS_SELECTOR, "div.heading"):
                    break
            except:
                pass
            time.sleep(1)
        else:
            self.fail("time out")
        driver.find_element_by_css_selector("div.heading").click()
        driver.find_element_by_link_text("Person ID").click()
        for i in range(60):
            try:
                if self.is_element_present(By.CSS_SELECTOR, "div.value-item"):
                    break
            except:
                pass
            time.sleep(1)
        else:
            self.fail("time out")
        driver.find_element_by_xpath("//div[4]/div/div/div/div/div/div[3]/div/div/div/div/button").click()
        driver.find_element_by_xpath("//div[5]/button[2]").click()
        driver.find_element_by_xpath("//button[2]").click()
        for i in range(60):
            try:
                if self.is_element_present(By.CSS_SELECTOR, "tbody"):
                    break
            except:
                pass
            time.sleep(1)
        else:
            self.fail("time out")
        driver.find_element_by_xpath("//div[@id='wrap']/div/div/div/ul/li[2]/a/span").click()
        driver.find_element_by_xpath("//div[@id='c1f1']/div[4]/div/div/div/div/div/div[3]/div/div/div/div/button[2]").click()
        driver.find_element_by_xpath("//div[2]/div/div/div/button").click()
        driver.find_element_by_xpath("//button[2]").click()
        for i in range(60):
            try:
                if self.is_element_present(By.CSS_SELECTOR, "tbody"):
                    break
            except:
                pass
            time.sleep(1)
        else:
            self.fail("time out")
        driver.find_element_by_link_text("Query").click()
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
