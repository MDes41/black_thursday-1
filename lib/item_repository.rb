require          'csv'
require          'pry'

class ItemRepository

  attr_reader :all, :data

  def initialize(data)
    @data = data
    @all = []
    load_data
  end

  def load_data
    contents = CSV.open data, headers: true, header_converters: :symbol
    @all = contents.to_a.map {|row| row.to_hash}
    binding.pry
  end
end
