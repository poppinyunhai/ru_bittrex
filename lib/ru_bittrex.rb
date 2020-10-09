require "ru_bittrex/version"

module RuBittrex
  class Error < StandardError; end
  class AuthError < Error; end

  autoload :Configuration, 'ru_bittrex/configuration'
  autoload :Client,        'ru_bittrex/client'
  autoload :ClientApi,     'ru_bittrex/client_api'
  autoload :ClientHelper,  'ru_bittrex/client_helper'
  autoload :Helpers,       'ru_bittrex/helpers'
  autoload :Account,       'ru_bittrex/account'
  autoload :Address,       'ru_bittrex/address'
  autoload :Balance,       'ru_bittrex/balance'
  autoload :Currency,      'ru_bittrex/currency'
  autoload :Deposit,       'ru_bittrex/deposit'
  autoload :Market,        'ru_bittrex/market'
  autoload :Order,         'ru_bittrex/order'
  autoload :Summary,       'ru_bittrex/summary'
  autoload :Ticker,        'ru_bittrex/ticker'

  class << self
    attr_accessor :configuration

    def configuration
      @configuration ||= Configuration.new
    end

    # def reset
    #   @configuration = Configuration.new
    # end

    def configure
      yield(configuration)
    end

    def client
      @client ||= Client.new(configuration.auth)
    end
  end
end
