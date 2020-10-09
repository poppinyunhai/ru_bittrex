module Bittrex
  class Market
    extend ClientHelper

    def get_all
      client.get 'markets'
    end

    def get_summaries
      client.get 'markets/summaries'
    end

    def get_tickers
      client.get 'markets/tickers'
    end

    def get_ticker(market)
      client.get "markets/#{market}/tickers"
    end

    def get(market)
      client.get "markets/#{market}"
    end

    def get_summary(market)
      client.get "markets/#{market}/summary"
    end

    def get_orderbook(market)
      client.get "markets/#{market}/orderbook"
    end

    def get_trades(market)
      client.get "markets/#{market}/trades"
    end
  end
end
