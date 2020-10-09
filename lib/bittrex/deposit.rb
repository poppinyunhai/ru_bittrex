module Bittrex
  class Deposit
    extend ClientHelper
    include Helpers

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
      @updated_at    = extract_timestamp(attrs["updatedAt"])
      @completed_at  = extract_timestamp(attrs["completedAt"])
      @status        = attrs["status"]
      @source        = attrs["source"]
      @raw           = attrs
    end

    def self.closed(params = {})
      collection _get('deposits/closed', params)
    end

    def self.open(params = {})
      collection _get('deposits/open', params)
    end

    def self.get(id, params = {})
      new _get("deposits/#{id}", params)
    end
  end
end
