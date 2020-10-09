module Bittrex
  class Balance
    extend ClientHelper

    # def initialize
    # end

    def get_all
      client.get 'balances'
    end

    # TODO: check that currency exists
    def get(currency)
      client.get "balances/#{currency}"
    end
  end
end
