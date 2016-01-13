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

  # def find_all
end
