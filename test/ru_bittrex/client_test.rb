require "test_helper"

module RuBittrex
  class ClientTest < Minitest::Test
    def test_auth_error
      assert_raises(AuthError) { Client.new }
    end

    def test_successful_initialization
      @client = Client.new(api_key: '1234567', secret: '7654321')

      assert_instance_of RuBittrex::Client, @client
      assert_equal '1234567', @client.api_key
      assert_equal '7654321', @client.secret
    end
  end
end
