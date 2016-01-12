require 'pry'

class Merchant
  attr_reader :merchant_name, :merchant_id

  def initialize(name, id = nil)
    @merchant_name = name[:store_name]
    @merchant_id   = id[:id]
  end
end
