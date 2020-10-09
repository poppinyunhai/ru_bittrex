require "bittrex/version"

module Bittrex
  class Error < StandardError; end
  class AuthError < Error; end

  autoload :Configuration, 'bittrex/configuration'
  autoload :ClientHelper, 'bittrex/client_helper'
  autoload :Client,   'bittrex/client'
  autoload :Balance,  'bittrex/balance'
  autoload :Order,    'bittrex/order'
  autoload :Account,  'bittrex/account'
  autoload :Address,  'bittrex/address'
  autoload :Currency, 'bittrex/currency'
  autoload :Deposit,  'bittrex/deposit'
  autoload :Market,   'bittrex/market'

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
