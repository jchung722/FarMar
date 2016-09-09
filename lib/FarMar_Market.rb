#FarMar_Market.rb

#Market class under FarMar module
class FarMar::Market

  attr_reader :id, :name, :address, :city, :county, :state, :zip

  #initialize object with instance variables according to csv file data
  def initialize(id, name, address, city, county, state, zip)
    @id = id.to_i #convert to fixnum
    @name = name
    @address = address
    @city = city
    @county = county
    @state = state
    @zip = zip
  end

  #self.all method: lists all Market objects in an Array
  def self.all?
    market_list = []
    CSV.open("support/markets.csv", 'r').each do |line|
      market_list << FarMar::Market.new(line[0], line[1], line[2], line[3], line[4], line[5], line[6])
    end
    return market_list
  end

  #self.find method: finds instance of Market with input id
  def self.find(id)
    match = 0
    CSV.open("support/markets.csv", 'r').each do |line|
      if line[0] == id.to_s
        match = FarMar::Market.new(line[0], line[1], line[2], line[3], line[4], line[5], line[6])
      end
    end
    return match
  end

  #vendors method: uses FarMar::Vendor class's self.by_market method to list all vendors associated with Market
  def vendors
    FarMar::Vendor.by_market(id)
  end

  #products method: lists all products sold at the Market based on list of vendors(from vendors method)
  def products
    vendor_list = vendors #vendors method returns list of vendors
    products = []
    vendor_list.each do |vendor|
      products += vendor.products #call products method on specified vendor
    end
    return products
  end

  #self.search method: lists all markets that have the search_term. not case sensitive :)
  def self.search(search_term)
    matched_markets = []
    markets = self.all?
    markets.each do |market|
      if market.name.downcase.include?(search_term.downcase)
        matched_markets << market
      end
    end
    return matched_markets
  end

  #preferred_vendor method: returns vendor with highest revenue; no input gives total revenue, and an input day gives revenue for given date.
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

  #worst_vendor method: returns vendor with lowest revenue; only works on total revenue for now; haven't tackled specific date because I didn't want to deal with ties =_=
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
