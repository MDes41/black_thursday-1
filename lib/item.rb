require 'pry'

class Item
  attr_reader :name, :id

  #BigDecimal significant figures should == row[:unit_price].size
  #that way it will know what to expect for the length of figures

  #format the time to ( , %F & %T ) that way stuff can be done!
  #be cautious about the UTC time stuff
  #require 'time'
  #"2009-12-09 12:08:04 UTC", "%F, %T"
  #example of how time should be passed in similar to our item csv data file

  def initialize(item_info)
    @name = item_info[:name]
    @id = item_info[:id]
  end
end
