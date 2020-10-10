require "date"
require "test_helper"

module RuBittrex
  class DepositTest < Minitest::Test
    def test_deposit_structure
      data = fixture(:deposit)
      deposit = Deposit.new(data)

      assert_equal "rf3fr-r3fr45w-fry55-g54wr", deposit.id
      assert_equal "BTC", deposit.currency
      assert_equal "1.3345", deposit.quantity
      assert_equal "35243tg57hh7yre53e5wt35at5", deposit.address
      assert_equal "", deposit.address_tag
      assert_equal "sfawrg67u85a4tt3w6uw", deposit.tx_id
      assert_equal "30", deposit.confirmations
      assert_equal DateTime.parse("2018-08-10T00:00:00Z"), deposit.updated_at
      assert_equal DateTime.parse("2018-08-10T00:00:00Z"), deposit.completed_at
      assert_equal "COMPLETED", deposit.status
      assert_equal "BLOCKCHAIN", deposit.source
    end

    def test_get_deposit
      data = fixture(:deposit)
      deposit = Deposit.new(data)

      Deposit.expects(:get).with("rf3fr-r3fr45w-fry55-g54wr").returns(deposit)
      assert_equal deposit, Deposit.get("rf3fr-r3fr45w-fry55-g54wr")
    end

    def test_get_closed_deposits
      data = fixture(:deposit)
      deposits = [Deposit.new(data), Deposit.new(data)]

      Deposit.expects(:closed).returns(deposits)
      assert_equal deposits, Deposit.closed
    end

    def test_get_open_deposits
      data = fixture(:deposit)
      deposits = [Deposit.new(data), Deposit.new(data)]

      Deposit.expects(:open).returns(deposits)
      assert_equal deposits, Deposit.open
    end
  end
end
