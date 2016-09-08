#FarMar_Product.rb

class FarMar::Product
  include FarMar

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

  # def vendor
  #   see Module FarMar
  # end

  def sales
    product_sales = []
    CSV.open("support/sales.csv", 'r').each do |line|
      if line[4] == id.to_s
        product_sales << FarMar::Sale.new(line[0], line[1], line[2], line[3], line[4])
      end
    end
    return product_sales
  end

  def number_of_sales
    array_sales = sales
    num_sales = array_sales.length
    puts "#{num_sales} #{name} were sold"
    return num_sales
  end

  def self.by_vendor(vendor_id)
    vendor_products = []
    CSV.open("support/products.csv", 'r').each do |line|
      if line[2] == vendor_id.to_s
        vendor_products << FarMar::Product.new(line[0], line[1], line[2])
      end
    end
    return vendor_products
  end

end
