module Bittrex
  class Deposit
    extend ClientHelper

    attr_reader :id, :currency, :quantity, :address, :address_tag,
                :txid, :confirmations, :updated_at, :completed_at,
                :status, :source, :raw

    def initialize(attrs = {})
      @id            = attrs["id"]
      @currency      = attrs["currencySymbol"]
      @quantity      = attrs["quantity"]
      @address       = attrs["cryptoAddress"]
      @address_tag   = attrs["cryptoAddressTag"]
      @txid          = attrs["txId"]
      @confirmations = attrs["confirmations"]
      @updated_at    = attrs["updatedAt"]
      @completed_at  = attrs["completedAt"]
      @status        = attrs["status"]
      @source        = attrs["source"]
      @raw           = attrs
    end

    def self.closed(params = {})
      c = params.delete(:client)
      client(c).get('deposits/closed', params).map { |data| new(data) }
    end

    # def get_open(params = {})
    #   client.get 'deposits/open', params
    # end

    # def get_closed(params = {})
    #   client.get 'deposits/closed', params
    # end

    # def get(id)
    #   client.get "deposits/#{id}"
    # end
  end
end
