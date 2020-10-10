$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "json"
require "ru_bittrex"
require "minitest/autorun"
require "mocha/minitest"

def fixture(resource)
  path = File.join(RuBittrex.root, "test/fixtures/#{resource}.json")
  JSON.parse File.read(path)
end
