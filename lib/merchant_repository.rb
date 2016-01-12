# require_relative './../data/sample/merchant_sample'
require_relative 'merchant'
require          'csv'
require          'pry'
class MerchantRepository

  def all
    []
  end

  def load_data(data)
    contents = CSV.open data, headers: true, header_converters: :symbol
    contents.each do |row|
      all << Merchant.new({:store_name => row[:name]})
    end
  end

  def find_by_id(store_name)
    all.find {|name| name.merchant_name == store_name.gsub(" ", "") }
  end

  def find_by_name
    []
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
