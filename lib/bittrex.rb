require "bittrex/version"

module Bittrex
  class Error < StandardError; end

  autoload :Client,   'bittrex/client'
  autoload :Balance,  'bittrex/balance'
  autoload :Order,    'bittrex/order'
  autoload :Account,  'bittrex/account'
  autoload :Address,  'bittrex/address'
  autoload :Currency, 'bittrex/currency'
  autoload :Deposit,  'bittrex/deposit'
  autoload :Market,   'bittrex/market'

  def self.client
    # @client ||= Client.new(configuration.auth)
    @client ||= Client.new
  end
end
