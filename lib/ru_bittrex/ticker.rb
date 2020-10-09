module RuBittrex
  class Ticker
    extend ClientHelper
    include Helpers

    attr_reader :symbol, :last_rate, :bid_rate, :ask_rate, :raw

    def initialize(attrs = {})
      @symbol    = attrs["symbol"]
      @last_rate = attrs["lastTradeRate"]
      @bid_rate  = attrs["bidRate"]
      @ask_rate  = attrs["askRate"]
      @raw       = attrs
    end

    def self.all(params = {})
      collection _get('markets/tickers', params)
    end

    def self.get(market, params = {})
      new _get("markets/#{market}/ticker", params)
    end
  end
end
