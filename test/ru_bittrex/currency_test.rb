require "test_helper"

module RuBittrex
  class CurrencyTest < Minitest::Test
    def test_currency_structure
      data = fixture(:currency)
      currency = Currency.new(data)

      assert_equal "BTC", currency.symbol
      assert_equal "Bitcoin", currency.name
      assert_equal "BITCOIN", currency.coin_type
      assert_equal "ONLINE", currency.status
      assert_equal "10", currency.min_confirmations
      assert_equal "example notice", currency.notice
      assert_equal "0.005", currency.tx_fee
      assert_equal "https://example.com/bitcoin.png", currency.logo_url
      assert_equal ["US"], currency.prohibited_in
      assert_equal "sfw35y4eer6eyhegsye", currency.address
      assert_equal [], currency.terms
    end

    def test_get_currency
      data = fixture(:currency)
      currency = Currency.new(data)

      Currency.expects(:get).with('btc').returns(currency)
      assert_equal currency, Currency.get('btc')
    end

    def test_get_currencies
      data = fixture(:currency)
      currencies = [Currency.new(data), Currency.new(data)]

      Currency.expects(:all).returns(currencies)
      assert_equal currencies, Currency.all
    end
  end
end
