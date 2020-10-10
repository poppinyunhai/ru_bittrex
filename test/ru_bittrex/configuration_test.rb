require "test_helper"

module RuBittrex
  class ConfigurationTest < Minitest::Test
    def test_initialization
      config = Configuration.new

      assert_nil config.api_key
      assert_nil config.secret
    end

    def test_configurable
      RuBittrex.reset_client
      RuBittrex.reset_config

      config = RuBittrex.configuration
      api_key = '12345'
      secret = '6789'

      assert_nil config.api_key
      assert_nil config.secret

      RuBittrex.configure do |config|
        assert_instance_of RuBittrex::Configuration, config

        config.api_key = api_key
        config.secret  = secret
      end

      assert_equal api_key, config.api_key
      assert_equal secret, config.secret

      auth = { api_key: api_key, secret: secret }
      assert_equal auth, config.auth
    end
  end
end
