require          'csv'
require          'pry'
require_relative 'sales_engine'
require_relative 'item'
require_relative 'load_data'

class ItemRepository
  attr_reader :all, :data
  include LoadData

  def initialize(data)
    @data = data
    @all = []
    load_data(data)
  end

  def standardize(item_name_inputed)
    item_name_inputed.to_s.downcase.gsub(" ", "")
  end

  def find_by_id(item_id_inputed)
    standard_item_id = standardize(item_id_inputed)
    item_info = @all.find {|line| standardize(line[:id]) == standard_item_id}
    binding.pry
    item_info.nil? ? item = nil : item = Item.new(item_info)
    # binding.pry
    item
  end

  def find_by_name(item_name_inputed)
    standard_item_name = standardize(item_name_inputed)
    item_info = @all.find {|line| standardize(line[:name]) == standard_item_name}
    item_info.nil? ? item = nil : item = Item.new(item_info)
    item
  end

  # def find_all_with_description(description_inputed)
  #   standard_
  #
  # end


  #notes for find_all_by_price_in_range
  #within the argument for our tests have the range like this
  #ex: (700..900) => which will be a range object check methods on ruby docs
  #use the method include? to check through given range!
  #call the method .to_i to the BigDecimal objects to compare the classes
  #range is a collection of integers that need BigDecimal to turn to one in order
  #to compare it with each other



  def find_all
  end
