module Bittrex
  class Account
    extend ClientHelper

    def get
      client.get 'account'
    end

    def volume
      client.get 'account/volume'
    end
  end
end
