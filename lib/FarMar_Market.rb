#FarMar_Market.rb

require_relative '../FarMar/'

class FarMar::Market

  attr_reader :id, :name, :address, :city, :county, :state, :zip

  def initialize(id, name, address, city, county, state, zip)
    @id = id.to_i
    @name = name
    @address = address
    @city = city
    @county = county
    @state = state
    @zip = zip
  end

  def self.all?
    market_list = []
    CSV.open("support/markets.csv", 'r').each do |line|
      market_list << FarMar::Market.new(line[0], line[1], line[2], line[3], line[4], line[5], line[6])
    end
    return market_list
  end

  def self.find(id)
    match = 0
    CSV.open("support/markets.csv", 'r').each do |line|
      if line[0] == id.to_s
        match = FarMar::Market.new(line[0], line[1], line[2], line[3], line[4], line[5], line[6])
      end
    end
    return match
  end

  def vendors
    market_vendors = []
    CSV.open("support/vendors.csv", 'r').each do |line|
      if line[3] == id.to_s
        market_vendors << FarMar::Vendor.new(line[0], line[1], line[2], line[3])
      end
    end
    return market_vendors
  end

end

# a = FarMar::Market.new("1","People's Co-op Farmers Market","30th and Burnside","Portland","Multnomah","Oregon","97202")
# puts a.vendors
