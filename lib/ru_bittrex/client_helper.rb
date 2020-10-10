module RuBittrex
  module ClientHelper
    private

    def client(custom_client = nil)
      custom_client || RuBittrex.client
    end

    def _get(path, params)
      custom_client = params.delete(:client)
      client(custom_client).get(path, params)
    end

    def collection(data)
      data.map { |record| new(record) }
    end
  end
end
