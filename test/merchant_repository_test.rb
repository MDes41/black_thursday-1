require_relative './../lib/merchant_repository'
require_relative '../lib/sales_engine'
require_relative './test_helper'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'


class MerchantRepositoryTest < Minitest::Test

  def test_that_class_exist
    assert MerchantRepository
  end

  def test_that_all_method_exist
    assert MerchantRepository.method_defined? :all
  end

  def test_that_find_by_id_method_exist
    assert MerchantRepository.method_defined? :find_by_id
  end

  def test_that_find_by_name_method_exist
    assert MerchantRepository.method_defined? :find_by_name
  end

  def test_that_all_by_name_method_exist
    assert MerchantRepository.method_defined? :find_all_by_name
  end

  def test_that_load_data_method_exist
    assert MerchantRepository.method_defined? :load_data
  end

  def test_that_all_method_returns_an_array
    se = SalesEngine.from_csv({
                              :merchants => "./data/merchant_sample.csv",
                              })
    mr = se.merchants

    assert_kind_of(Array, mr.all)
  end

  def test_that_find_by_name_method_is_an_instance_of_merchant
    se = SalesEngine.from_csv({
                              :merchants => "./data/merchant_sample.csv",
                              })
    mr = se.merchants
    merchant = mr.find_by_name("MiniatureBikez")

    assert_equal Merchant, merchant.class
  end

  def test_that_find_by_name_returns_a_known_merchant_name
    se = SalesEngine.from_csv({
                              :items     => "./data/items.csv",
                              :merchants => "./data/merchants.csv"
                              })
    mr       = se.merchants
    merchant = mr.find_by_name("MiniatureBikez")

    assert_equal "MiniatureBikez", merchant.name
  end

  def test_edge_that_find_by_name_works_when_spaces_are_included
    se = SalesEngine.from_csv({
                              :items     => "./data/items.csv",
                              :merchants => "./data/merchants.csv"
                              })
    mr       = se.merchants
    merchant = mr.find_by_name("Miniature B i kez")

    assert_equal "MiniatureBikez", merchant.name
  end

  def test_edge_that_find_by_name_works_when_not_case_sensitive
    se = SalesEngine.from_csv({
                              :items     => "./data/items.csv",
                              :merchants => "./data/merchants.csv"
                              })
    mr       = se.merchants
    merchant = mr.find_by_name("mInIaTuRebIKez")

    assert_equal "MiniatureBikez", merchant.name
  end

  def test_edge_that_find_by_name_returns_nil_for_unknown_merchant_name
    se = SalesEngine.from_csv({
                              :items     => "./data/items.csv",
                              :merchants => "./data/merchants.csv"
                              })
    mr       = se.merchants
    merchant = mr.find_by_name("Turing School")

    assert_equal nil, merchant
  end

end
