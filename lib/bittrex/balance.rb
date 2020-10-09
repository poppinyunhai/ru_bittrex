module Bittrex
  class Balance
    # def initialize
    # end

    def get_all
      client.get 'balances'
    end

    # TODO: check that currency exists
    def get(currency)
      client.get "balances/#{currency}"
    end

    private

    def client
      @client ||= Bittrex.client
    end
  end
end
