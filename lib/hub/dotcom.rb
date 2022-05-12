# frozen_string_literal: true
module Hub
  class Dotcom
    attr_accessor :name, :base_url, :api_mode, :api_path, :api_key, :api_secret

    def initialize name:, base_url: nil, api_mode: nil, api_path: nil, api_key: nil, api_secret: nil
      @name       = name.downcase
      @base_url   = base_url   || ENV['base_url'.upcase]
      @api_mode   = api_mode   || ENV['api_mode'.upcase]
      @api_path   = api_path   || ENV['api_path'.upcase]
      @api_key    = api_key    || ENV['api_key'.upcase]
      @api_secret = api_secret || ENV['api_secret'.upcase]
    end

    def endpoint
      @base_url + @api_path
    end

    def sign 
      'dummy_signature'
    end
  end
end