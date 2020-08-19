from robot.api import logger
from robot.libraries.BuiltIn import BuiltIn

builtin = BuiltIn()


def get_builtin_param(key: str) -> str:
    value = builtin.get_variable_value('${' + key + '}', default=None)
    logger.info(f"Getting builtin data by key '${key}' = '${value}'")
    return value
