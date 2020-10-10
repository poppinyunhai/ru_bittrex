# RuBittrex

RuBittrex is a Ruby wrapper for the Bittrex API.

Currently RuBittrex only supports [Bittrex API V3](https://bittrex.github.io/api/v3) and is available for use with multiple clients (multiple Bittrex accounts).

## Table of Contents
- [Installation](#installation) 
- [Usage](#usage)
- [Development](#development)
- [Testing](#testing)
- [Contributing](#contributing)
- [License](#license)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ru_bittrex'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install ru_bittrex
   
## Usage

#### Auth Configuration
In Order to use RuBittrex you must add authentication configuration after requiring the gem, or in an initializer.
```ruby
RuBittrex.configure do |config|
  config.api_key = "MY_API_KEY"
  config.secret  = "MY_SECRET"
end
```

#### Basic Usage
Once configured you can use any of the classes by calling class methods directly:
```ruby
RuBittrex::Currency.get('btc')
```
The code above returns an instance of `RuBittrex::Currency`

This is a comprehensive list of the classes available and their methods:
```ruby
RuBittrex::Account.get
RuBittrex::Account.volume

RuBittrex::Address.all
RuBittrex::Address.get(currency) #==> RuBittrex::Address.get('btc')

RuBittrex::Balance.all
RuBittrex::Balance.get(currency) #==> RuBittrex::Balance.get('btc')

RuBittrex::Currency.all
RuBittrex::Currency.get(symbol) #==> RuBittrex::Currency.get('btc')

RuBittrex::Deposit.open(opts) #==> RuBittrex::Deposit.get(status: 'PENDING')
RuBittrex::Deposit.closed(opts) #==> RuBittrex::Deposit.get(status: 'COMPLETED')
RuBittrex::Deposit.get(id) #==> RuBittrex::Deposit.get('353fd-etwv-wrtvv')

RuBittrex::Market.all
RuBittrex::Market.get(symbol) #==> RuBittrex::Market.get('btc-eth')

RuBittrex::Summary.all
RuBittrex::Summary.get(market) #==> RuBittrex::Summary.get('btc-eth')

RuBittrex::Ticker.all
RuBittrex::Ticker.get(market) #==> RuBittrex::Ticker.get('btc-eth')
```
For the full list of options and params please refer to the [Bittrex API Documentation](https://bittrex.github.io/api/v3)

#### Client Usage
Alternatively you can instantiate the client directly, and then call the methods from there.
```ruby
client = RuBittrex::Client.new(api_key: 'MY_API_KEY', secret: 'MY_SECRET')
client.currency('btc')
```
The code above returns an instance of `RuBittrex::Currency`

This is especially useful when needing to perform actions from multiple clients (hence multiple accounts).

This is a comprehensive list of the methods available from the client:
```ruby
client.account
client.account_volume

client.addresses
client.address(currency) #===> client.address('btc')

client.balances
client.balance(currency) #===> client.balance('btc')

client.currencies
client.currency(symbol) #===> client.currency('btc')

client.open_deposits(opts) #===> client.open_deposit(status: 'PENDING')
client.closed_deposits(opts) #===> client.closed_deposit(status: 'COMPLETED')
client.deposit(id) #===> client.deposit('353fd-etwv-wrtvv')

client.markets
client.market(symbol) #===> client.market('btc-eth')

client.summaries
client.summary(market) #===> client.summary('btc-eth')

client.tickers
client.ticker(market) #===> client.ticker('btc-eth')
```
For the full list of options and params please refer to the [Bittrex API Documentation](https://bittrex.github.io/api/v3)

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

When using the gem in development remember to create a `credentials.yml` file in the root of the library folder and insert a valid **api_key** and **secret** from Bittrex. You can find an example in `credentials.example.yml`.


## Testing

To test the gem simply run `rake test` from the root of the library folder.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/davidmetta/ru_bittrex.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
