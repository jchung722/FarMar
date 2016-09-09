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

  def products
    vendor_list = vendors
    products = []
    vendor_list.each do |vendor|
      products += vendor.products
    end
    return products
  end

  def self.search(search_term)
    matched_markets = []
    markets = self.all?
    markets.each do |market|
      if market.name.downcase.include?(search_term)
        matched_markets << market
      end
    end
    return matched_markets
  end

  def preferred_vendor(date= "all")
    vendor_list = vendors
    best_vendor_revenue = 0
    best_vendor = 0
    vendor_list.each do |vendor|
      if vendor.revenue(date) > best_vendor_revenue
        best_vendor_revenue = vendor.revenue(date)
        best_vendor = vendor
      end
    end
    return best_vendor
  end

  def worst_vendor
    vendor_list = vendors
    worst_vendor_revenue = preferred_vendor.revenue
    worst_vendor = 0
    vendor_list.each do |vendor|
      if vendor.revenue < worst_vendor_revenue
        worst_vendor_revenue = vendor.revenue
        worst_vendor = vendor
      end
    end
    return worst_vendor
  end

  ##randomstuff method: just wanted to see which vendor had the highest/lowest revenue without calculating by hand :P
  # def randomstuff
  #   vendor_list = vendors
  #   names = vendor_list.map do |vendor|
  #     vendor.name
  #   end
  #   a = vendor_list.map do |vendor|
  #     vendor.revenue("2013-11-06")
  #   end
  #   puts names
  #   puts a
  # end

end
