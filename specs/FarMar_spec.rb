#FarMar_spec.rb

require_relative 'Spec_helper'
require_relative '../FarMar/'


describe 'Testing FarMar' do
  let(:new_market) { FarMar::Market.new("1","People's Co-op Farmers Market","30th and Burnside","Portland","Multnomah","Oregon","97202") }
  let(:new_product) { FarMar::Product.new("1","Dry Beets","1") }
  let(:new_sale) { FarMar::Sale.new("1","9290","2013-11-07 04:34:56 -0800","1","1") }
  let(:new_vendor) { FarMar::Vendor.new("1","Feil-Farrell","8","1") }
  ##########------------------- Baseline ------------------------##########

  it "Must return Market class" do
    expect(new_market.class).must_equal(FarMar::Market)
    expect(new_market.name).must_equal("People's Co-op Farmers Market")
    expect(FarMar::Market.all?.class).must_equal(Array)
    a = FarMar::Market.find(1)
    expect(a.name).must_equal("People's Co-op Farmers Market")
  end

  it "Must return Product class" do
    expect(new_product.name).must_equal("Dry Beets")
    expect(FarMar::Product.all?.class).must_equal(Array)
    b = FarMar::Product.find(1)
    expect(b.name).must_equal("Dry Beets")
  end

  it "Must return Sale class" do
    expect(new_sale.id).must_equal(1)
    expect(FarMar::Sale.all?.class).must_equal(Array)
    c = FarMar::Sale.find(1)
    expect(c.vendor_id).must_equal(1)
  end

  it "Must return Vendor class" do
    expect(new_vendor.name).must_equal("Feil-Farrell")
    expect(FarMar::Vendor.all?.class).must_equal(Array)
    d = FarMar::Vendor.find(1)
    expect(d.name).must_equal("Feil-Farrell")
  end

  it "Market class vendor method must return a list of vendors matching with market id" do
    new_market = FarMar::Market.new("1","People's Co-op Farmers Market","30th and Burnside","Portland","Multnomah","Oregon","97202")
    expect(new_market.vendors.class).must_equal(Array)
  end

end
