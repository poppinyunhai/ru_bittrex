require "test_helper"

module RuBittrex
  class TickerTest < Minitest::Test
    def test_ticker_structure
      data = fixture(:ticker)
      ticker = Ticker.new(data)

      assert_equal "4ART-BTC", ticker.symbol
      assert_equal "0.0035", ticker.last_rate
      assert_equal "0.00356", ticker.bid_rate
      assert_equal "0.00346", ticker.ask_rate
    end

    def test_get_ticker
      data = fixture(:ticker)
      ticker = Ticker.new(data)

      Ticker.expects(:get).with("4ART-BTC").returns(ticker)
      assert_equal ticker, Ticker.get("4ART-BTC")
    end

    def test_get_tickers
      data = fixture(:ticker)
      tickers = [Ticker.new(data), Ticker.new(data)]

      Ticker.expects(:all).returns(tickers)
      assert_equal tickers, Ticker.all
    end
  end
end
