from library.models.symbol_ui import SymbolUI


class UIKeywords:
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'

    def __init__(self):
        self.symbol_ui = SymbolUI()

    def get_symbol_ui(self):
        return self.symbol_ui
