module Bittrex
  class Currency
    def get_all
      client.get 'currencies'
    end

    def get(currency)
      client.get "currencies/#{currency}"
    end

    private

    def client
      @client ||= Bittrex.client
    end
  end
end
