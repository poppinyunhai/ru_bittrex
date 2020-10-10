module RuBittrex
  class Currency
    extend ClientHelper

    attr_reader :symbol, :name, :coin_type, :status, :min_confirmations, :notice,
                :tx_fee, :logo_url, :prohibited_in, :address, :terms_of_service
    alias_method :terms, :terms_of_service

    def initialize(attrs = {})
      @symbol            = attrs["symbol"]
      @name              = attrs["name"]
      @coin_type         = attrs["coinType"]
      @status            = attrs["status"]
      @min_confirmations = attrs["minConfirmations"]
      @notice            = attrs["notice"]
      @tx_fee            = attrs["txFee"]
      @logo_url          = attrs["logoUrl"]
      @prohibited_in     = attrs["prohibitedIn"]
      @address           = attrs["baseAddress"]
      @terms_of_service  = attrs["associatedTermsOfService"]
      @raw               = attrs
    end

    def self.all(params = {})
      collection _get('currencies', params)
    end

    def self.get(currency, params = {})
      new _get("currencies/#{currency}", params)
    end
  end
end
