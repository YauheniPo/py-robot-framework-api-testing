from marshmallow_dataclass import dataclass


@dataclass
class QuoteType:

    exchange: str
    shortName: str
    longName: str
    exchangeTimezoneName: str
    exchangeTimezoneShortName: str
    isEsgPopulated: bool
    gmtOffSetMilliseconds: str
    quoteType: str
    symbol: str
    messageBoardId: str
    market: str
