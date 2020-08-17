from robot.libraries.BuiltIn import BuiltIn


class Param(object):
    builtin = BuiltIn()

    def get_env_param(self, key: str) -> str:
        return self.builtin.get_variable_value('${' + key + '}', default=None)
