# require $LOAD_PATH.unshift(File.expand_path("./test_helper.rb",__dir__))
require_relative './../lib/merchant_repository'
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
    mr = MerchantRepository.new

    assert_kind_of(Array, mr.all)
  end

  def test_that_find_by_name_method_is_an_instance_of_merchant
    mr       = MerchantRepository.new
    mr.load_data("merchant_sample.csv")
    merchant = mr.find_by_name("MiniatureBikez")

    assert_equal Merchant, merchant.class
  end

  def test_that_find_by_name_returns_a_known_merchant_name
    mr       = MerchantRepository.new
    mr.load_data("merchant_sample.csv")
    merchant = mr.find_by_name("MiniatureBikez")
    assert_equal "MiniatureBikez", merchant.merchant_name
  end

  def test_edge_that_find_by_name_works_when_spaces_are_included
    mr       = MerchantRepository.new
    mr.load_data("merchant_sample.csv")
    merchant = mr.find_by_name("Miniature Bikez")

    assert_equal "MiniatureBikez", merchant.merchant_name
  end

  def test_edge_that_find_by_name_works_when_not_case_sensitive
    skip
    mr       = MerchantRepository.new
    mr.load_data("merchant_sample.csv")
    merchant = mr.find_by_name("mInIaTuRebIKez")
    
    assert_equal "MiniatureBikez", merchant.merchant_name
  end

  def test_that_find_by_name_returns_nil_for_unknown_merchant_name
    mr       = MerchantRepository.new
    mr.load_data("merchant_sample.csv")
    merchant = mr.find_by_name("Turing School")

    assert_equal nil, merchant
  end

end
