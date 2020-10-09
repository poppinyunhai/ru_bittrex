module RuBittrex
  class Configuration
    attr_accessor :api_key, :secret

    def initialize
      @api_key = nil
      @secret  = nil
    end

    def auth
      { api_key: @api_key, secret: @secret }
    end
  end
end
