module Bittrex
  class Currency
    extend ClientHelper

    def get_all
      client.get 'currencies'
    end

    def get(currency)
      client.get "currencies/#{currency}"
    end
  end
end
