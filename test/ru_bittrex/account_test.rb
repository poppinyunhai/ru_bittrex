require "date"
require "test_helper"

module RuBittrex
  class AccountTest < Minitest::Test
    def test_account_structure
      data = fixture(:account)
      account = Account.new(data)

      assert_equal "2r34rgreg", account.id
      assert_equal DateTime.parse("2018-08-10T00:00:00Z"), account.updated_at
      assert_equal "1555.5050", account.volume
    end

    def test_get_account
      data = fixture(:account)
      account = Account.new(data)

      Account.expects(:get).returns(account)
      assert_equal account, Account.get
    end

    def test_account_volume
      data = fixture(:account)
      account = Account.new(data)

      Account.expects(:volume).returns(account)
      assert_equal account, Account.volume
    end
  end
end
