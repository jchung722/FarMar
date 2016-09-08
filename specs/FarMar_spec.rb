#FarMar_spec.rb

require_relative 'Spec_helper'
require_relative '../FarMar/'


describe 'Testing FarMar' do
  let(:new_market) { FarMar::Market.new("1","People's Co-op Farmers Market","30th and Burnside","Portland","Multnomah","Oregon","97202") }
  let(:new_product) { FarMar::Product.new("1","Dry Beets","1") }
  let(:new_sale) { FarMar::Sale.new("1","9290","2013-11-07 04:34:56 -0800","1","1") }
  let(:new_vendor) { FarMar::Vendor.new("1","Feil-Farrell","8","1") }


#############--------------FarMar::Market Tests--------------------###########

  it "Must return Market class" do
    expect(new_market).must_be_instance_of(FarMar::Market)
    expect(new_market.name).must_equal("People's Co-op Farmers Market")
  end

  it "Must return all instances of markets and find market by id" do
    expect(FarMar::Market.all?.class).must_equal(Array)
    expect(FarMar::Market.find(1).name).must_equal("People's Co-op Farmers Market")
  end

  it "Must return a list of vendors matching with market id" do
    expect(new_market.vendors).must_be_instance_of(Array)
    expect(new_market.vendors.length).must_equal(6)
  end

#############--------------FarMar::Product Tests--------------------###########

  it "Must return Product class" do
    expect(new_product).must_be_instance_of(FarMar::Product)
    expect(new_product.name).must_equal("Dry Beets")
  end

  it "Must return all instances of products and find product by id" do
    expect(FarMar::Product.all?.class).must_equal(Array)
    expect(FarMar::Product.find(1).name).must_equal("Dry Beets")
  end

#############--------------FarMar::Sale Tests--------------------#############

  it "Must return Sale class" do
    expect(new_sale).must_be_instance_of(FarMar::Sale)
    expect(new_sale.id).must_equal(1)
  end

  it "Must return all instances of sales and find sale by id" do
    expect(FarMar::Sale.all?.class).must_equal(Array)
    expect(FarMar::Sale.find(1).vendor_id).must_equal(1)
  end

#############--------------FarMar::Vendor Tests--------------------#############

  it "Must return Vendor class" do
    expect(new_vendor).must_be_instance_of(FarMar::Vendor)
    expect(new_vendor.name).must_equal("Feil-Farrell")
  end

  it "Must return all instances of vendors and find vendor by id" do
    expect(FarMar::Vendor.all?.class).must_equal(Array)
    expect(FarMar::Vendor.find(1).name).must_equal("Feil-Farrell")
  end

end
