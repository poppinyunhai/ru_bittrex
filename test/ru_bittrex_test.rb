require "test_helper"

class RuBittrexTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::RuBittrex::VERSION
  end
end
