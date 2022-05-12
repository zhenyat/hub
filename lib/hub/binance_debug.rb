# frozen_string_literal: true

module Hub
  # puts Tools.green Time.at(Tools.timestamp.to_i / 1000)
  dotcom = Dotcom.new name: 'binance'
  # pp dotcom.endpoint

  # GET https://testnet.binance.vision/api/v3/time
  api = PublicApi.new(dotcom: dotcom, method: 'time')
  puts "\nServer Time:", Tools.blue(Time.at(api.request['serverTime']/1000))
  # Tools.blue "Server time: #{Time.at(api.request['serverTime'].to_i/1000)}"     

  # GET https://testnet.binance.vision/api/v3/ticker/24hr?symbol=BTCUSDT
  options = {symbol: 'BTCUSDT'}
  api = PublicApi.new(dotcom: dotcom, method: 'ticker', extension: '24hr', options: options)
  puts "\nTicker:", Tools.blue(api.request)

  # pp api
  # pp dotcom.name
  # pp api.dotcom.name
  # pp api.parameters
  # pp api.methods_list
  # pp api.method_available? 'ticker' # 'timer' => raises error
end
