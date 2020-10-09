module Bittrex
  class Address
    extend ClientHelper

    attr_reader :status, :currency, :address, :raw

    def initialize(attrs = {})
      @status   = attrs["status"]
      @currency = attrs["currencySymbol"]
      @address  = attrs["cryptoAddress"]
      @raw      = attrs
    end

    def self.all(params = {})
      collection _get('addresses', params)
    end

    def self.get(currency, params = {})
      new _get("addresses/#{currency}", params)
    end

    # TODO: provision new address
    # def self.create
    # end
  end
end
