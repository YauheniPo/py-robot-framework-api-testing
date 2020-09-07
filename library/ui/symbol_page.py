from models.symbol_ui import SymbolUI
from ui.common import Common
from ui.constants import SUMMARY_UI_API_MATCHER


class SymbolPage(Common):
    symbol_title_locator = "//div[@id='quote-header-info']//h1"
    summary_item_value_locator = "//div[@id='quote-summary']//tr[.//text()='{}']//span[@class]"

    def get_symbol_title(self):
        return self.selenium_library.driver.find_element_by_xpath(
            self.symbol_title_locator).text

    def fetch_symbol_ui(self):
        symbol_ui = SymbolUI()
        for key, value in SUMMARY_UI_API_MATCHER.items():
            self.built_in.run_keyword(
                'SeleniumLibrary.Wait Until Element Is Visible',
                self.summary_item_value_locator.format(key))
            summary_value = self.selenium_library.driver.find_element_by_xpath(
                self.summary_item_value_locator.format(key)).text
            symbol_ui.__dict__[value] = summary_value
        return symbol_ui
