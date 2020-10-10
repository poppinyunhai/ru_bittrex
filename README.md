# Bittrex

Ruby wrapper for the Bittrex API

currently only V3 is supported

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

In Order to use RuBittrex you must add auth configuration after requiring the gem, or in an initializer.
```ruby
RuBittrex.configure do |config|
  config.api_key = "api_key"
  config.secret  = "secret"
end
```

Once configured you can use any of the classes like by calling class methods directly:
```ruby
RuBittrex::Currency.get('btc')
```
The code above returns an instance of `RuBittrex::Currency`

Alternatively you can instantiate the client directly, and then call the methods from there.
```ruby
client = RuBittrex::Client.new(api_key: 'api_key', secret: 'secret')
client.currency('btc')
```

this is especially useful when needing to perform actions from multiple clients, or multiple accounts.

you can find the full documentation for the Bittrex API [here](https://bittrex.github.io/api/v3)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/davidmetta/ru_bittrex.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
