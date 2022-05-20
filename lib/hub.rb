# frozen_string_literal: true

require 'yaml'
require 'json'
require 'net/http'
require 'openssl'
require 'net/http'
require 'pp'

require_relative "hub/version"
require_relative "hub/dotcom"
require_relative "hub/tools"
require_relative "hub/public_api"
require_relative "hub/trade_api"
# require_relative "hub/binance_public_debug"
# require_relative "hub/cexio_public_debug"
# require_relative "hub/cexio_private_debug"

module Hub
  class Error < StandardError; end

  # dotcom = Dotcom.new name: 'kraken', api_mode: 'public'
  # pp dotcom
end
