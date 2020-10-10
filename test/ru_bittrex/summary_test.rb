require "date"
require "test_helper"

module RuBittrex
  class SummaryTest < Minitest::Test
    def test_summary_structure
      data = fixture(:summary)
      summary = Summary.new(data)

      assert_equal "4ART-BTC", summary.symbol
      assert_equal "0.00003", summary.high
      assert_equal "0.000005", summary.low
      assert_equal "14455.56", summary.volume
      assert_equal "14.5543", summary.quote_volume
      assert_equal "-2.76", summary.percent_change
      assert_equal DateTime.parse("2018-08-10T00:00:00Z"), summary.updated_at
    end

    def test_get_summary
      data = fixture(:summary)
      summary = Summary.new(data)

      Summary.expects(:get).with("4ART-BTC").returns(summary)
      assert_equal summary, Summary.get("4ART-BTC")
    end

    def test_get_summaries
      data = fixture(:summary)
      summaries = [Summary.new(data), Summary.new(data)]

      Summary.expects(:all).returns(summaries)
      assert_equal summaries, Summary.all
    end
  end
end
