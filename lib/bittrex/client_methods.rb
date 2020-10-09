module Bittrex
  module ClientMethods

    ## Accounts

    def account
      Account.get(cl)
    end

    def account_volume
      Account.volume(cl)
    end

    ## Addresses

    def addresses
      Address.all(cl)
    end

    def address(currency)
      Address.get(currency, cl)
    end

    ## Balances

    def balances
      Balance.all(cl)
    end

    def balance(currency)
      Balance.get(currency, cl)
    end

    ## Currencies

    def currencies
      Currency.all(cl)
    end

    def currency(symbol)
      Currency.get(symbol, cl)
    end

    ## Deposits

    def open_deposits(params = {})
      Deposit.open(params.merge(cl))
    end

    def closed_deposits(params = {})
      Deposit.closed(params.merge(cl))
    end

    def deposit(id)
      Deposit.get(id, cl)
    end

    ## Markets

    def markets
      Market.all(cl)
    end

    def market(symbol)
      Market.get(symbol, cl)
    end

    ## Summaries

    def summaries
      Summary.all(cl)
    end

    def summary(market)
      Summary.get(market, cl)
    end

    ## Tickers

    def tickers
      Ticker.all(cl)
    end

    def ticker(market)
      Ticker.get(market, cl)
    end

    ## TODO: "markets/#{market}/orderbook" and "markets/#{market}/trades"

    private

    def cl
      { client: self }
    end
  end
end
