#FarMar.rb
require 'csv'

#create FarMar module
module FarMar

#vendor method: used in Sale and Product classes using 'include'
def vendor
  vendor_match = 0 #set initial value of variable
  CSV.open("support/vendors.csv", 'r').each do |line| #open csv file
    if line[0] == vendor_id.to_s #checks to see if id in csv file matches vendor_id trace of object.
      vendor_match = FarMar::Vendor.new(line[0], line[1], line[2], line[3]) #sets variable to matching vendor instance
    end
  end
  return vendor_match
end

end

require_relative 'lib/FarMar_Market'
require_relative 'lib/FarMar_Vendor'
require_relative 'lib/FarMar_Sale'
require_relative 'lib/FarMar_Product'

#########------------------Random Test Stuff-----------------------###########

# a = FarMar::Market.new("1","People's Co-op Farmers Market","30th and Burnside","Portland","Multnomah","Oregon","97202")
# puts a.randomstuff
# puts a.preferred_vendor.name
# puts a.worst_vendor.name

# puts FarMar::Vendor.by_market(1)
# b = FarMar::Vendor.new("1","Feil-Farrell","8","1")
# puts b.revenue("2013-11-06")
# puts b.products
# puts b.market.name

# c = FarMar::Product.new("1","Dry Beets","1")
# puts c.vendor
# puts FarMar::Product.by_vendor(8)

# d = FarMar::Sale.new("1","9290","2013-11-07 04:34:56 -0800","1","1")
# puts d.product.name
# puts FarMar::Sale.between(DateTime.parse("2013-11-07 04:30:00 -0800").to_time, DateTime.parse("2013-11-07 05:00:00 -0800").to_time)
