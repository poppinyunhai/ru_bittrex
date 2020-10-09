module Bittrex
  class Deposit
    def get_open(params = {})
      client.get 'deposits/open', params
    end

    def get_closed(params = {})
      client.get 'deposits/closed', params
    end

    def get(id)
      client.get "deposits/#{id}"
    end

    private

    def client
      @client ||= Bittrex.client
    end
  end
end
