require "test_helper"

module RuBittrex
  class AddressTest < Minitest::Test
    def test_address_structure
      data = fixture(:address)
      address = Address.new(data)

      assert_equal "ACTIVE", address.status
      assert_equal "BTC", address.currency
      assert_equal "242tgf4tgty45gtg", address.address
    end

    def test_get_address
      data = fixture(:address)
      address = Address.new(data)

      Address.expects(:get).with('btc').returns(address)
      assert_equal address, Address.get('btc')
    end

    def test_get_addresses
      data = fixture(:address)
      addresses = [Address.new(data), Address.new(data)]

      Address.expects(:all).returns(addresses)
      assert_equal addresses, Address.all
    end
  end
end
