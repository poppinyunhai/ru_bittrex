require "test_helper"

module RuBittrex
  class ClientHelperTestHelper
    extend ClientHelper

    def initialize(nonce)
      @nonce = nonce
    end

    def collection_test(data)
      collection data
    end
  end

  class ClientHelperTest < Minitest::Test
    include ClientHelper

    def test_client_method
      default_client = Client.new(api_key: '12345', secret: '6789')
      custom_client = Client.new(api_key: '102030', secret: '405060')

      RuBittrex.expects(:client).returns(default_client)

      assert_equal default_client, client
      assert_equal custom_client, client(custom_client)
    end

    def test_get_helper_method
      RuBittrex.reset_client

      market_data = fixture(:market)
      markets = [market_data, market_data]

      Configuration.any_instance.expects(:auth).returns({ api_key: '12345', secret: '6789' })
      Client.any_instance.expects(:get).with('markets', {}).returns(markets)

      assert_equal markets, _get('markets', {})
    end

    def test_collection_method
      helpers = [ClientHelperTestHelper.new(1), ClientHelperTestHelper.new(2)]

      ClientHelperTestHelper.expects(:collection_test).with([1, 2]).returns(helpers)
      assert_equal helpers, ClientHelperTestHelper.collection_test([1, 2])
    end
  end
end
