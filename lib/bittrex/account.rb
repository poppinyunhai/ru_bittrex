module Bittrex
  class Account
    extend ClientHelper

    attr_reader :id, :updated_at, :volume_30_days, :raw
    alias_method :volume, :volume_30_days

    def initialize(attrs = {})
      @id             = attrs["accountId"]
      @updated_at     = attrs["updated"]
      @volume_30_days = attrs["volume30days"]
      @raw            = attrs
    end

    def self.get(params = {})
      new _get('account', params)
    end

    def self.volume(params = {})
      new _get('account/volume', params)
    end
  end
end
