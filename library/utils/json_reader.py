import json
import os

import configuration
from models.quote_type import QuoteType
from utils.common import Common


class ConfigReader(Common):
    """Class with json file reader functions"""

    def get_json_from_file(self, path):
        with open(path) as json_file:
            return json.loads(json_file.read())

    def get_obj_from_json(self, obj, path):
        return obj.Schema().load(self.get_json_from_file(path))

    def get_quote_type_from_json(self, symbol: str):
        return self.get_obj_from_json(QuoteType,
                                      os.path.join(configuration.DATA_FOLDER,
                                                   f"{symbol.upper()}{configuration.NAME_PART_QUOTE_TYPE_JSON}"))
