#FarMar_Market.rb

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

  #vendor method: uses FarMar::Vendor class's self.by_market method
  def vendors
    FarMar::Vendor.by_market(id)
  end

end
