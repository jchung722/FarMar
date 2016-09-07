#FarMar_Sale.rb

require_relative '../FarMar/'

require 'date'

class FarMar::Sale

  attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id

  def initialize(id, amount, purchase_time, vendor_id, product_id)
    @id = id.to_i
    @amount = amount.to_i
    @purchase_time = DateTime.parse(purchase_time).to_time
    @vendor_id = vendor_id.to_i
    @product_id = product_id.to_i
  end

  def self.all?
    collection = []
    CSV.open("support/sales.csv", 'r').each do |line|
      collection << FarMar::Sale.new(line[0], line[1], line[2], line[3], line[4])
    end
    return collection
  end

  def self.find(id)
    match = 0
    CSV.open("support/sales.csv", 'r').each do |line|
      if line[0] == id.to_s
        match = FarMar::Sale.new(line[0], line[1], line[2], line[3], line[4])
      end
    end
    return match
  end

  def vendor

  end

  def sales

  end

  def number_of_sales

  end

  def self.by_vendor(vendor_id)

  end

end
