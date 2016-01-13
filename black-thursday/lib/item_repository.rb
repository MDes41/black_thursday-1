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

  def stdrd(item_name_inputed)
    item_name_inputed.to_s.downcase.gsub(" ", "")
  end

  def find_by_id(item_id_inputed)
    stdrd_item_id = stdrd(item_id_inputed)
    item_info = @all.find {|line| stdrd(line[:id]) == stdrd_item_id}
    item_info.nil? ? item = nil : item = Item.new(item_info)
    item
  end

  def find_by_name(item_name_inputed)
    stdrd_item_name = stdrd(item_name_inputed)
    item_info = @all.find {|line| stdrd(line[:name]) == stdrd_item_name}
    item_info.nil? ? item = nil : item = Item.new(item_info)
    item
  end

  def find_all_with_description(inputed_description)
    stdrd_inputed_description = stdrd(inputed_description)
    item_info = @all.find_all do |line|
      stdrd(line[:description]).gsub("\n","").include?(stdrd_inputed_description)
    end
    if item_info.nil?
      []
    else
      x = item_info.map {|item_info| Item.new(item_info)}
    end
  end

  def stdprice(input_price)
    input_price.gsub(/\D/)
  end

  def match_sig_digits(std_input_price, data_price)
    significantstd_input_price.length
  end

  def find_all_by_price(input_price)
      std_input_price = stdprice(input_price)
      item_price = @all.find_all do |line| (line[:unit_price]).include?(std_input_price)
      end
      if item_info.nil?
        []
      else
        item_info.map {|item_info| Item.new(item_info).description}
      end
  end

end
