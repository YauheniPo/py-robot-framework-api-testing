BASE_URL = "https://apidojo-yahoo-finance-v1.p.rapidapi.com"
params_region = {'region': 'US'}
params_lang = {'lang': 'en'}
params_region_lang = {**params_region, **params_lang}

# Endpoint
STOCK = 'stock/'
# Methods
GET_DETAIL = 'get-detail'
V2 = 'v2/'
GET_ANALYSIS = 'get-analysis/'
GET_SUMMARY = 'get-summary/'

# Endpoint
MARKET = 'market/'
# Methods
GET_QUOTES = 'get-quotes/'
