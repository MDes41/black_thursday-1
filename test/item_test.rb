require_relative './../lib/item'
require_relative './test_helper'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'


class ItemTest < Minitest::Test

  def test_that_class_exist
    assert Item
  end

  def test_that_id_method_exist
    skip
    assert Item.method_defined? :id
  end

  def test_that_name_method_exist
    skip
    assert Item.method_defined? :name
  end

  def test_that_description_method_exist
    skip
    assert Item.method_defined? :description
  end

  def test_that_unit_price_method_exist
    skip
    assert Item.method_defined? :unit_price
  end

  def test_that_created_at_method_exist
    skip
    assert Item.method_defined? :created_at
  end

  def test_that_updated_at_method_exist
    skip
    assert Item.method_defined? :updated_at
  end

  def test_that_id_method_returns_item_id
    skip
    i = Item.new({
      :id          => 263395237
      :name        => "Pencil",
      :description => "You can use it to write things",
      :unit_price  => BigDecimal.new(10.99,4),
      :created_at  => Time.now,
      :updated_at  => Time.now,
    })

    assert_equal 263395237, i.id
  end
end



end
