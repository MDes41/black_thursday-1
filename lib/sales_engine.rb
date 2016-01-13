require_relative 'merchant_repository'
require_relative 'item_repository'
require          'csv'

class SalesEngine
  attr_reader :csv_hash

  def initialize(csv_hash)
    @csv_hash = csv_hash
  end

  def self.from_csv(csv_hash)
    SalesEngine.new(csv_hash)
  end

  def items
    ItemRepository.new(csv_hash[:items])
  end

  def merchants
    MerchantRepository.new(csv_hash[:merchants])
  end

end
