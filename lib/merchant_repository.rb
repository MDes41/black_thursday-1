# require_relative './../data/sample/merchant_sample'
require_relative 'merchant'
require          'csv'
require          'pry'
class MerchantRepository

  attr_reader :all

  def initialize
    @all = []
  end

  def load_data(data)
    contents = CSV.open data, headers: true, header_converters: :symbol
    # contents.to_a
    # binding.pry

    contents.each do |row|
      # store_name_hash = {:store_name => row[:name]}
      all << Merchant.new({:store_name => row[:name]}, {:store_id => row[:id]})
      binding.pry
    end
  end

  def find_by_id

  end

  def find_by_name(store_name)
    binding.pry
    all.find {|name| name.merchant_name == store_name.gsub(" ", "") }
  end

  def find_all_by_name

  end
end

if __FILE__ == $PROGRAM_NAME
mr = MerchantRepository.new
mr.load_data
x = mr.find_by_name
binding.pry
end
