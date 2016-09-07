#FarMar.rb
require 'csv'

module FarMar

def vendor
  vendor_match = 0
  CSV.open("support/vendors.csv", 'r').each do |line|
    if line[0] == vendor_id.to_s
      vendor_match = FarMar::Vendor.new(line[0], line[1], line[2], line[3])
    end
  end
  return vendor_match
end

end

require_relative 'lib/FarMar_Market'
require_relative 'lib/FarMar_Sale'
require_relative 'lib/FarMar_Vendor'
require_relative 'lib/FarMar_Product'
