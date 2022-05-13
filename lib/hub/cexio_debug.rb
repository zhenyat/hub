# frozen_string_literal: true
###############################################################################
#   Testing of CEX.IO REST Public API
#   https://cex.io/rest-api
#
#   13.05.2022  Created
###############################################################################
module Hub
  # puts Tools.green Time.at(Tools.timestamp.to_i / 1000)
  dotcom = Dotcom.new name: 'cexio', api_mode: 'demo'
  # pp dotcom

  ### Method: currency_limits ###
  # GET https://cex.io/api/currency_limits
  api = PublicApi.new dotcom: dotcom, method: 'currency_limits'
  puts "\nCurrency Limits", Tools.blue(api.request)

  ###  Method: Ticker  ###
  # GET https://cex.io/api/ticker/BTC/USD
  extension = 'BTC/USD'
  api = PublicApi.new dotcom: dotcom, method: 'ticker', extension: extension
  puts "\nTicker: BTCUSD", Tools.blue(api.request)

  ###  Method: Tickers  ###
  # GET https://cex.io/api/tickers/{marketSymbol1}/{marketSymbol2}/.../{marketSymbolN}
  extension = 'BTC/ETH/BCH'
  api = PublicApi.new dotcom: dotcom, method: 'tickers', extension: extension
  puts "\nTickers: BTC/ETH/BCH", Tools.blue(api.request)

  ###  Method: Last Price  ###
  # GET https://cex.io/api/last_price/{symbol1}/{symbol2}
  extension = 'ETH/USD'
  api = PublicApi.new dotcom: dotcom, method: 'last_price', extension: extension
  puts "\nLast price: ETH/USD", Tools.blue(api.request)

  ###  Method: Last Prices  ###
  # GET https://cex.io/api/last_prices/{marketSymbol1}/{marketSymbol2}/.../{marketSymbolN}
  extension = 'BTC/ETH/BCH'
  api = PublicApi.new dotcom: dotcom, method: 'last_prices', extension: extension
  puts "\nLast prices: BTC/ETH/BCH", Tools.blue(api.request)

  ###  Method: Historical 1m OHLCV Chart  ###
  # GET https://cex.io/api/ohlcv/hd/{date}/{symbol1}/{symbol2}
  extension = 'hd/20220510/ETH/USD'
  api = PublicApi.new dotcom: dotcom, method: 'ohlcv', extension: extension
  puts "\nOHLCV 1 m Chart: ETH/USD", Tools.blue(api.request)

  ###  Method: Order Book  ###
  # GET https://cex.io/api/order_book/{symbol1}/{symbol2}/
  extension = 'BTC/USD/'
  api = PublicApi.new dotcom: dotcom, method: 'order_book', extension: extension
  puts "\nOrde Book: BTCUSD", Tools.blue(api.request)

  # GET https://cex.io/api/order_book/{symbol1}/{symbol2}?depth=N  (n=1 - default: ALL)
  options = {depth: 5}  # Slash at the end !!!
  api = PublicApi.new dotcom: dotcom, method: 'order_book', extension: extension, options: options
  puts "\nOrder Book: BTCUSD, depth = 5", Tools.blue(api.request)

  ###  Method: Trade History  ###
  # GET https://cex.io/api/trade_history/{symbol1}/{symbol2}/
  extension = 'ETH/USD/'
  api = PublicApi.new dotcom: dotcom, method: 'trade_history', extension: extension
  puts "\nTrade_history: ETHUSD", Tools.blue(api.request)

  # GET https://cex.io/api/trade_history/{symbol1}/{symbol2}?since={tid}/
  extension = 'ETH/USD/'      # Slash at the end !!!
  options = {since: 6282000}
  api = PublicApi.new dotcom: dotcom, method: 'trade_history', extension: extension, options: options
  puts "\nTrade_history: ETHUSD with Trade ID > 6282000", Tools.blue(api.request)
end
