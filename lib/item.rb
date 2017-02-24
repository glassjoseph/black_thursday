require 'pry'
require "bigdecimal" 
require "date"

class Item
  attr_reader :id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at
  
  def initialize(data)
    @id  = data[:id]
    @name = data[:name]
    @description = data[:description]
# binding.pry
    @unit_price =  data[:unit_price]
    @merchant_id = data[:merchant_id]
    @created_at  = data[:created_at] #Time.now
    @updated_at = data[:updated_at] #Time.now
    # binding.pry
  end

# unit_price_to_dollars - returns the price of the item in dollars formatted as a Float
  def unit_price_to_dollars
    unit_price.to_f
  end

end
