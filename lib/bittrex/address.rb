module Bittrex
  class Address
    extend ClientHelper

    def get_all
      client.get 'addresses'
    end

    def get(currency)
      client.get "addresses/#{currency}"
    end

    # TODO: provision new address
    # def create
    # end
  end
end
