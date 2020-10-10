require "date"
require "test_helper"

module RuBittrex
  class HelpersTest < Minitest::Test
    include Helpers

    def test_extract_timestamp_helper
      date = "2018-08-10T00:00:00Z"
      parsed_date = DateTime.parse("2018-08-10T00:00:00Z")

      assert_nil extract_timestamp(nil)
      assert_nil extract_timestamp("")
      assert_equal parsed_date, extract_timestamp(date)
    end
  end
end
