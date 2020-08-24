from robot.libraries.BuiltIn import BuiltIn
from robot.api import logger


class Common:
    """Class with common UI functions"""

    built_in = BuiltIn()
    selenium_library = built_in.get_library_instance('SeleniumLibrary')

    def get_driver_session_id(self):
        session_id = self.selenium_library.driver.session_id
        logger.info(f"Driver session ID: ${session_id}")
        return session_id
