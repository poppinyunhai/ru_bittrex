module Bittrex
  class Account
    def get
      client.get 'account'
    end

    def volume
      client.get 'account/volume'
    end

    private

    def client
      @client ||= Bittrex.client
    end
  end
end
