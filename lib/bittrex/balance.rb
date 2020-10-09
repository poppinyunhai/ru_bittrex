module Bittrex
  class Balance
    extend ClientHelper
    include Helpers

    attr_reader :currency, :total, :available, :updated_at, :raw

    def initialize(attrs = {})
      @currency   = attrs["currencySymbol"]
      @total      = attrs["total"]
      @available  = attrs["available"]
      @updated_at = extract_timestamp(attrs["updatedAt"])
      @raw        = attrs
    end

    def self.all(params = {})
      collection _get('balances', params)
    end

    # TODO: check that currency exists
    def self.get(currency, params = {})
      new _get("balances/#{currency}", params)
    end
  end
end
