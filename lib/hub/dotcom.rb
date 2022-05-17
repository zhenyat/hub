# frozen_string_literal: true
module Hub
  class Dotcom
    attr_accessor :name, :api_mode, :base_url, :api_mode, :api_path, :api_key, :api_secret, :api_user_id

    def initialize name:, api_mode:, base_url: nil, api_path: nil, api_key: nil, api_secret: nil, api_user_id: nil
      @name        = name.downcase
      @api_mode    = api_mode.downcase
      @base_url    = base_url    || ENV["#{name}_#{api_mode}_base_url".upcase]
      @api_path    = api_path    || ENV["#{name}_#{api_mode}_api_path".upcase]
      @api_key     = api_key     || ENV["#{name}_#{api_mode}_api_key".upcase]
      @api_secret  = api_secret  || ENV["#{name}_#{api_mode}_api_secret".upcase]
      @api_user_id = api_user_id || ENV["#{name}_#{api_mode}_api_user_id".upcase]
    end

    def endpoint
      @base_url + @api_path
    end

    def signature
      case @name
      when 'cexio'
        api_params = Tools.nonce.to_s + @api_user_id + @api_key
        digest = OpenSSL::Digest::SHA256.new
        OpenSSL::HMAC.hexdigest(digest, @api_secret, api_params)
      when 'binance'

      else
        raise "\n----- Dotcom name '#{@name}' is invalid!\n"
      end
    end
  end
end