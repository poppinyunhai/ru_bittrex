require "date"
require "test_helper"

module RuBittrex
  class BalanceTest < Minitest::Test
    def test_balance_structure
      data = fixture(:balance)
      balance = Balance.new(data)

      assert_equal "BTC", balance.currency
      assert_equal "1.4567", balance.total
      assert_equal "1.4567", balance.available
      assert_equal DateTime.parse("2018-08-10T00:00:00Z"), balance.updated_at
    end

    def test_get_balance
      data = fixture(:balance)
      balance = Balance.new(data)

      Balance.expects(:get).with('btc').returns(balance)
      assert_equal balance, Balance.get('btc')
    end

    def test_get_addresses
      data = fixture(:balance)
      balances = [Balance.new(data), Balance.new(data)]

      Balance.expects(:all).returns(balances)
      assert_equal balances, Balance.all
    end
  end
end
