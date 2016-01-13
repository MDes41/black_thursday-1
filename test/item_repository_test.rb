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

    #let the test run at first to fail to get the correct number
    #since it's too long to count manually
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

  def test_that_find_by_id_returns_known_item
    skip
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"
    })

    ir   = se.items
    #//FROM ITEM.CSV FILE//
    #//HEADERS//
    #id,name,description,unit_price,merchant_id,created_at,updated_at
    #//ITEM LINE//
    #263395237,510+ RealPush Icon Set,"You&#39;ve got a total socialmedia iconset! Almost every social icon on the planet earth.

    item = ir.find_by_id(263395237)

    assert_equal "263395237", item.id
  end

  def test_edge_that_find_by_id_returns_known_item_even_when_inputted_as_string
    skip
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"
    })

    ir   = se.items
    #//FROM ITEM.CSV FILE//
    #//HEADERS//
    #id,name,description,unit_price,merchant_id,created_at,updated_at
    #//ITEM LINE//
    #263395237,510+ RealPush Icon Set,"You&#39;ve got a total socialmedia iconset! Almost every social icon on the planet earth.
    item = ir.find_by_id("263395237")

    assert_equal "263395237", item.id
  end

  def test_edge_that_find_by_id_returns_nil_for_unknown_id
    skip
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"
    })

    ir   = se.items
    #//FROM ITEM.CSV FILE//
    #//HEADERS//
    #id,name,description,unit_price,merchant_id,created_at,updated_at
    #//ITEM LINE//
    #263395237,510+ RealPush Icon Set,"You&#39;ve got a total socialmedia iconset! Almost every social icon on the planet earth.

    item = ir.find_by_id(000000000)

    assert_equal nil, item
  end

  def test_find_by_name_returns_a_known_item
    skip
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"
    })

    ir   = se.items
    #//FROM ITEM.CSV FILE//
    #//HEADERS//
    #id,name,description,unit_price,merchant_id,created_at,updated_at
    #//ITEM LINE//
    #263395237,510+ RealPush Icon Set,"You&#39;ve got a total socialmedia iconset! Almost every social icon on the planet earth.
    item = ir.find_by_name("510+ RealPush Icon Set")

    assert_equal "510+ RealPush Icon Set", item.name
  end

  def test_find_by_name_returns_nil_for_unknown_item
    skip
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"
    })

    ir   = se.items
    #//FROM ITEM.CSV FILE//
    #//HEADERS//
    #id,name,description,unit_price,merchant_id,created_at,updated_at
    #//ITEM LINE//
    #263395237,510+ RealPush Icon Set,"You&#39;ve got a total socialmedia iconset! Almost every social icon on the planet earth.
    item = ir.find_by_name("Turing School")

    assert_equal nil, item
  end

  def test_edge_that_no_matter_where_spaces_are_placed_find_by_name_returns_known_item
    skip
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"
    })

    ir   = se.items
    #//FROM ITEM.CSV FILE//
    #//HEADERS//
    #id,name,description,unit_price,merchant_id,created_at,updated_at
    #//ITEM LINE//
    #263395237,510+ RealPush Icon Set,"You&#39;ve got a total socialmedia iconset! Almost every social icon on the planet earth.
    item = ir.find_by_name("51 0+ R ealP ush Ic on Se t")

    assert_equal "510+ RealPush Icon Set", item.name
  end

  def test_edge_that_find_by_name_will_find_capitalized_known_item_name
    skip
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"
    })

    ir   = se.items
    #//FROM ITEM.CSV FILE//
    #//HEADERS//
    #id,name,description,unit_price,merchant_id,created_at,updated_at
    #//ITEM LINE//
    #263395237,510+ RealPush Icon Set,"You&#39;ve got a total socialmedia iconset! Almost every social icon on the planet earth.
    item = ir.find_by_name("510+ REALPUSH ICON SET")

    assert_equal "510+ RealPush Icon Set", item.name
  end

  def test_edge_that_find_by_name_will_find_known_item_typed_with_lowercase_and_upcase_letters
    skip
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"
    })

    ir   = se.items
    #//FROM ITEM.CSV FILE//
    #//HEADERS//
    #id,name,description,unit_price,merchant_id,created_at,updated_at
    #//ITEM LINE//
    #263395237,510+ RealPush Icon Set,"You&#39;ve got a total socialmedia iconset! Almost every social icon on the planet earth.
    item = ir.find_by_name("510+ ReaLPuSh iCoN SeT")

    assert_equal "510+ RealPush Icon Set", item.name
  end

  def test_that_find_all_with_description_is_an_array
    skip
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"
    })

    ir          = se.items
    description = ir.find_all_with_description("You&#39;ve got a total socialmedia iconset! Almost every social icon on the planet earth.")

    assert_equal Array, description.class
  end

  def test_that_find_all_with_description_returns_empty_array_when_it_matches_no_description
    skip
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"
    })

    ir          = se.items
    description = ir.find_all_with_description("I hate how this csv file looks on atom...")

    assert_equal [], description
  end

  def test_that_fragment_string_returns_all_matching_descriptions_for_find_all_with_description_method
    skip
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"
    })

    ir          = se.items
    description = ir.find_all_with_description("Acrylique sur toile exécutée")
    #this should return a couple matches, so run the test to see the real answer
    assert_equal ["a"], description
  end

  def test_edge_that_fragment_string_returns_all_matching_descriptions_even_when_typed_weird_for_find_all_with_description_method
    skip
    #case insensitive test
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"
    })

    ir          = se.items
    description = ir.find_all_with_description("AcrYlique sUr toIle exécuTée")
    #this should return a couple matches, so run the test to see the real answer
    assert_equal ["a"], description
  end

  def test_edge_that_fragment_string_returns_all_matching_descriptions_even_when_typed_weird_with_spaces_for_find_all_with_description_method
    #case insensitive test
    skip
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"
    })
    ir          = se.items
    description = ir.find_all_with_description("AcrY lique s Ur to Ile ex écuTée")
    #this should return a couple matches, so run the test to see the real answer
    assert_equal ["a"], description
  end

  def test_that_find_all_by_price_is_an_array
    skip
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"
    })
    ir    = se.items
    price = ir.find_all_by_price(10.99)
    #we will need to require the BigDecimal class from Item
    assert_equal Array, price.class
  end

  def test_that_find_all_by_price_returns_value
    skip
    #im not too sure how this will work with the BigDecimal so be cautious
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"
    })
    ir    = se.items
    price = ir.find_all_by_price(10.99)

    assert_equal 10.99, price.unit_price
  end

  def test_that_find_all_by_price_returns_empty_array_for_absurd_price
    skip
    #im not too sure how this will work with the BigDecimal so be cautious
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"
    })
    ir    = se.items
    price = ir.find_all_by_price(12345678.99)

    assert_equal [], price
  end

  def test_that_find_all_by_price_in_range_is_an_array
    skip
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"
    })
    ir    = se.items
    num   = (1..10)
    #reread readme to figure this out
    price = ir.find_all_by_price_in_range(num)
    #we will need to require the BigDecimal class from Item
    assert_equal Array, price.class
  end

  def test_that_find_all_by_price_in_range_returns_items_within_inputted_price_range
    skip
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"
    })
    ir    = se.items
    #reread readme to figure this out
    num   = (10..15)
    price = ir.find_all_by_price_in_range(num)
    #we will need to require the BigDecimal class from Item
    assert_equal ["items with prices from $10 through $15 will pop in here"], price
  end

  def test_that_find_all_by_price_in_range_returns_empty_array_for_unknown_price_range
    skip
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"
    })
    ir    = se.items
    #reread readme to figure this out
    num   = (1..2)
    price = ir.find_all_by_price_in_range(num)
    #we will need to require the BigDecimal class from Item
    assert_equal [], price
  end

  def test_that_find_all_by_merchant_id_is_an_array
    skip
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"
    })
    ir    = se.items
    price = ir.find_all_by_merchant_id(263395)
    #given the supplied fragment of an id it should output matches
    assert_equal Array, price.class
  end

  def test_that_find_all_by_merchant_id_returns_id_matches
    skip
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"
    })
    ir    = se.items
    price = ir.find_all_by_merchant_id(263395)
    #given the supplied fragment of an id it should output matches
    assert_equal ["here a couple of id matches will pop up"], price
  end

  def test_that_find_all_by_merchant_id_returns_empty_array_when_no_matches_are_found
    skip
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"
    })
    ir    = se.items
    price = ir.find_all_by_merchant_id(00000)
    #given the supplied fragment of an id it should output matches
    assert_equal [], price
  end


end
