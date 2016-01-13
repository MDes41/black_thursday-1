require_relative './../lib/item_repository'
require_relative '../lib/sales_engine'
require_relative './test_helper'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'


class ItemRepositoryTest < Minitest::Test

  def test_that_class_exist
    assert ItemRepository
  end

  def test_that_all_method_exist
    assert ItemRepository.method_defined? :all
  end

  def test_that_find_by_id_method_exist
    skip
    assert ItemRepository.method_defined? :find_by_id
  end

  def test_that_find_by_name_method_exist
    skip
    assert ItemRepository.method_defined? :find_by_name
  end

  def test_that_find_all_with_description_method_exist
    skip
    assert ItemRepository.method_defined? :find_all_with_description
  end

  def test_that_find_all_by_price_method_exist
    skip
    assert ItemRepository.method_defined? :find_all_by_price
  end

  def test_that_find_all_by_price_in_range_method_exist
    skip
    assert ItemRepository.method_defined? :find_all_by_price_in_range
  end

  def test_that_find_all_by_merchant_id_exist
    skip
    assert ItemRepository.method_defined? :find_all_by_merchant_id
  end

  def test_that_the_all_method_returns_an_array
    skip
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"
    })
    ir   = se.items

    assert_kind_of(Array, ir.all)
  end

  def test_that_array_has_all_elements_from_item_csv_file
    skip
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"
    })

    ir   = se.items

    assert_equal 0, ir.all.count
  end

  

  def test_that_it_will_return_an_instance_of_an_item
    skip
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"
    })

    ir   = se.items
    item = ir.find_by_name("Item Repellat Dolorum")

    assert_equal Item, item.class
  end



end
