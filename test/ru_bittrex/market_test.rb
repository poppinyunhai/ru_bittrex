require "date"
require "test_helper"

module RuBittrex
  class MarketTest < Minitest::Test
    def test_market_structure
      data = fixture(:market)
      market = Market.new(data)

      assert_equal "BCH-ETH", market.symbol
      assert_equal "BCH", market.base_currency
      assert_equal "ETH", market.quote_currency
      assert_equal "0.004", market.min_trade
      assert_equal "10", market.precision
      assert_equal "ONLINE", market.status
      assert_equal DateTime.parse("2018-08-10T00:00:00Z"), market.created_at
      assert_equal "example notice", market.notice
      assert_equal ["US"], market.prohibited_in
      assert_equal [], market.terms
    end

    def test_get_market
      data = fixture(:market)
      market = Market.new(data)

      Market.expects(:get).with("BCH-ETH").returns(market)
      assert_equal market, Market.get("BCH-ETH")
    end

    def test_get_markets
      data = fixture(:market)
      markets = [Market.new(data), Market.new(data)]

      Market.expects(:all).returns(markets)
      assert_equal markets, Market.all
    end
  end
end
