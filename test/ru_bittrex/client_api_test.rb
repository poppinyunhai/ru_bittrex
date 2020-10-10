require "test_helper"

module RuBittrex
  class ClientApiTest < Minitest::Test
    def test_client_api
      client = Client.new(api_key: '12345', secret: '6789')
      cl = { client: client }

      Account.expects(:get).with(cl).returns(:success)
      assert_equal :success, client.account

      Account.expects(:volume).with(cl).returns(:success)
      assert_equal :success, client.account_volume

      Address.expects(:all).with(cl).returns(:success)
      assert_equal :success, client.addresses

      Address.expects(:get).with('btc', cl).returns(:success)
      assert_equal :success, client.address('btc')

      Balance.expects(:all).with(cl).returns(:success)
      assert_equal :success, client.balances

      Balance.expects(:get).with('btc', cl).returns(:success)
      assert_equal :success, client.balance('btc')

      Currency.expects(:all).with(cl).returns(:success)
      assert_equal :success, client.currencies

      Currency.expects(:get).with('btc', cl).returns(:success)
      assert_equal :success, client.currency('btc')

      Deposit.expects(:open).with(cl).returns(:success)
      assert_equal :success, client.open_deposits

      Deposit.expects(:closed).with(cl).returns(:success)
      assert_equal :success, client.closed_deposits

      Deposit.expects(:get).with('324-ger4-34tg-w4e', cl).returns(:success)
      assert_equal :success, client.deposit('324-ger4-34tg-w4e')

      Market.expects(:all).with(cl).returns(:success)
      assert_equal :success, client.markets

      Market.expects(:get).with('btc-usd', cl).returns(:success)
      assert_equal :success, client.market('btc-usd')

      Summary.expects(:all).with(cl).returns(:success)
      assert_equal :success, client.summaries

      Summary.expects(:get).with('btc-usd', cl).returns(:success)
      assert_equal :success, client.summary('btc-usd')

      Ticker.expects(:all).with(cl).returns(:success)
      assert_equal :success, client.tickers

      Ticker.expects(:get).with('btc-usd', cl).returns(:success)
      assert_equal :success, client.ticker('btc-usd')
    end
  end
end
