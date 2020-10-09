module RuBittrex
  class Summary
    extend ClientHelper
    include Helpers

    attr_reader :symbol, :high, :low, :volume, :quote_volume, :percent_change,
                :updated_at, :raw

    def initialize(attrs = {})
      @symbol         = attrs["symbol"]
      @high           = attrs["high"]
      @low            = attrs["low"]
      @volume         = attrs["volume"]
      @quote_volume   = attrs["quoteVolume"]
      @percent_change = attrs["percentChange"]
      @updated_at     = extract_timestamp(attrs["updatedAt"])
      @raw            = attrs
    end

    def self.all(params = {})
      collection _get('markets/summaries', params)
    end

    def self.get(market, params = {})
      new _get("markets/#{market}/summary", params)
    end
  end
end
