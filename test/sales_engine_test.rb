require_relative './../lib/sales_engine'
require_relative './test_helper'
require          'pry'
require          'minitest/autorun'
require          'minitest/pride'


class SalesEngineTest < Minitest::Test

  def test_that_class_exist
    assert SalesEngine
  end

end
