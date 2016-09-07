#FarMar_Vendor.rb

require_relative '../FarMar/'

class FarMar::Vendor

  attr_reader :id, :name, :num_employees, :market_id

  def initialize(id, name, num_employees, market_id)
    @id = id.to_i
    @name = name
    @num_employees = num_employees.to_i
    @market_id = market_id.to_i
  end

  def self.all?
    collection = []
    CSV.open("support/vendors.csv", 'r').each do |line|
      collection << FarMar::Vendor.new(line[0], line[1], line[2], line[3])
    end
    return collection
  end

  def self.find(id)
    match = 0
    CSV.open("support/vendors.csv", 'r').each do |line|
      if line[0] == id.to_s
        match = FarMar::Vendor.new(line[0], line[1], line[2], line[3])
      end
    end
    return match
  end

  # def market
  #   vendor_market = 0
  #   CSV.open("support/markets.csv", 'r').each do |line|
  #     if line[0] == market_id.to_s
  #       vendor_market = FarMar::Market.new(line[0], line[1], line[2], line[3], line[4], line[5], line[6])
  #     end
  #   end
  #   return vendor_market
  # end
  #
  # def products
  #   vendor_products = []
  #   CSV.open("support/products.csv", 'r').each do |line|
  #     if line[2] == id.to_s
  #       vendor_products << FarMar::Product.new(line[0], line[1], line[2])
  #     end
  #   end
  #   return vendor_products
  # end

  def sales
    vendor_sales = []
    CSV.open("support/sales.csv", 'r').each do |line|
      if line[3] == id.to_s
        vendor_sales << FarMar::Sale.new(line[0], line[1], line[2], line[3], line[4])
      end
    end
    return vendor_sales
  end

  def revenue
    total_revenue = 0
    vendor_sales = sales
    vendor_sales.each do |sale|
      total_revenue += sale.amount
    end
    return total_revenue
  end

  def self.by_market(market_id)
    market_vendors = []
    CSV.open("support/vendors.csv", 'r').each do |line|
      if line[3] == market_id.to_s
        market_vendors << FarMar::Vendor.new(line[0], line[1], line[2], line[3])
      end
    end
    return market_vendors
  end

end

puts FarMar::Vendor.by_market(1)
# b = FarMar::Vendor.new("1","Feil-Farrell","8","1")
# puts b.revenue
# puts b.products
