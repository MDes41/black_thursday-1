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
end
