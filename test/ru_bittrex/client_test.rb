require "test_helper"

module RuBittrex
  class ClientTest < Minitest::Test
    def test_auth_error
      assert_raises(AuthError) { Client.new }
    end

    def test_custom_client
      client = Client.new(api_key: '1234567', secret: '7654321')

      assert_instance_of RuBittrex::Client, client
      assert_equal '1234567', client.api_key
      assert_equal '7654321', client.secret
    end

    def test_default_client
      RuBittrex.reset_client
      RuBittrex.reset_config

      api_key = '12345'
      secret = '6789'

      RuBittrex.configure do |config|
        config.api_key = api_key
        config.secret  = secret
      end

      client = RuBittrex.client

      assert_equal api_key, client.api_key
      assert_equal secret, client.secret
    end

    def reset_client
      RuBittrex.reset_client

      client = RuBittrex.client
      assert_equal client, RuBittrex.instance_variable_get("@client")

      RuBittrex.reset_client
      assert_nil RuBittrex.instance_variable_get("@client")
    end
  end
end
