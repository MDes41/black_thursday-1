
module LoadData

  def load_data(data)
    contents = CSV.open data, headers: true, header_converters: :symbol
    @all = contents.to_a.map {|row| row.to_hash}
  end






end
