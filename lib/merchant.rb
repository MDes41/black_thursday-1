require 'pry'

class Merchant
  attr_reader :merchant_name, :merchant_id

  def initialize(name, id)
    @merchant_name = name[:store_name]
    @merchant_id   = id[:store_id]
  end
end
