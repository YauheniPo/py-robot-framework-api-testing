from robot.api import logger
from robot.libraries.BuiltIn import BuiltIn


class Common:
    """Class with common functions"""

    built_in = BuiltIn()

    def get_builtin_param(self, key: str) -> str:
        value = self.built_in.get_variable_value('${' + key + '}', default=None)
        logger.info(f"Getting builtin data by key '${key}' = '${value}'")
        return value
