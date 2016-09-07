#FarMar_Product.rb

require_relative '../FarMar/'

class FarMar::Product

  attr_reader :id, :name, :vendor_id

  def initialize(id, name, vendor_id)
    @id = id.to_i
    @name = name
    @vendor_id = vendor_id.to_i
  end

  def self.all?
    collection = []
    CSV.open("support/products.csv", 'r').each do |line|
      collection << FarMar::Product.new(line[0], line[1], line[2])
    end
    return collection

  end

  def self.find(id)
    match = 0
    CSV.open("support/products.csv", 'r').each do |line|
      if line[0] == id.to_s
        match = FarMar::Product.new(line[0], line[1], line[2])
      end
    end
    return match
  end

  def vendor

  end

  def product

  end

  def self.between(beginning_time, end_time)

  end

end
