# frozen_string_literal: true
###############################################################################
#   Test of CEX.IO REST Private (Trade) API (POST requests)
#   V2:   https://docs.cex.io
#   V1:   https://cex.io/rest-api#private-api-calls
#
#   16.05.2022  Created
###############################################################################
module Hub
  dotcom = Dotcom.new name: 'cexio', api_mode: 'demo'
  pp dotcom
  # puts "===== #{dotcom.signature}"
  # exit

  ### Trade (Private) method: balance ###
  #   POST https://cex.io/api/balance/
  api = TradeApiPost.new dotcom: dotcom, method: 'balance'
  puts "\n#{dotcom.name.capitalize} -- Account balance", Tools.blue(api.request)

end
