module Bittrex
  module ClientHelper
    private

    def client(custom_client = nil)
      @client = custom_client || Bittrex.client
    end
  end
end
