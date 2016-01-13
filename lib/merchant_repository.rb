# require_relative './../data/sample/merchant_sample'
require_relative 'merchant'
require          'csv'
require          'pry'
class MerchantRepository

  attr_reader :all, :data

  def initialize(data)
    @data = data
    @all = []
    load_data
  end

  def load_data
    contents = CSV.open data, headers: true, header_converters: :symbol
    @all = contents.to_a.map {|row| row.to_hash}
  end

  def find_by_id

  end

  def find_by_name(store_name)
    standard_store_name = store_name.downcase.gsub(" ", "")
    merchant_info = @all.find {|line| line[:name].downcase  == standard_store_name}

    merchant_info.nil? ? merchant = nil : merchant = Merchant.new(merchant_info)
    merchant
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
