require 'pry'

class Merchant
  attr_accessor :name, :id

  def initialize(hash_name, hash_id)
    @name = hash_name[:name].gsub(" ","")
    @id   = hash_id[:id]
  end
end
