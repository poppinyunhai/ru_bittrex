module Bittrex
  class Market
    extend ClientHelper
    include Helpers

    attr_reader :symbol, :base_currency, :quote_currency, :min_trade, :precision,
                :status, :created_at, :notice, :prohibited_in, :terms_of_service
    alias_method :terms, :terms_of_service

    def initialize(attrs = {})
      @symbol           = attrs["symbol"]
      @base_currency    = attrs["baseCurrencySymbol"]
      @quote_currency   = attrs["quoteCurrencySymbol"]
      @min_trade        = attrs["minTradeSize"]
      @precision        = attrs["precision"]
      @status           = attrs["status"]
      @created_at       = extract_timestamp(attrs["createdAt"])
      @notice           = attrs["notice"]
      @prohibited_in    = attrs["prohibitedIn"]
      @terms_of_service = attrs["associatedTermsOfService"]
      @raw              = attrs
    end

    def self.all(params = {})
      collection _get('markets', params)
    end

    def self.get(market, params = {})
      new _get("markets/#{market}", params)
    end
  end
end
