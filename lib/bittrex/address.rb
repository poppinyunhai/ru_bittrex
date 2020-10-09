module Bittrex
  class Address
    def get_all
      client.get 'addresses'
    end

    def get(currency)
      client.get "addresses/#{currency}"
    end

    # TODO: provision new address
    # def create
    # end

    private

    def client
      @client ||= Bittrex.client
    end
  end
end
