require "bittrex/version"

module Bittrex
  class Error < StandardError; end
  class AuthError < Error; end

  autoload :Configuration, 'bittrex/configuration'
  autoload :Client,        'bittrex/client'
  autoload :ClientMethods, 'bittrex/client_methods'
  autoload :ClientHelper,  'bittrex/client_helper'
  autoload :Helpers,       'bittrex/helpers'
  autoload :Account,       'bittrex/account'
  autoload :Address,       'bittrex/address'
  autoload :Balance,       'bittrex/balance'
  autoload :Currency,      'bittrex/currency'
  autoload :Deposit,       'bittrex/deposit'
  autoload :Market,        'bittrex/market'
  autoload :Order,         'bittrex/order'
  autoload :Summary,       'bittrex/summary'
  autoload :Ticker,        'bittrex/ticker'

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
