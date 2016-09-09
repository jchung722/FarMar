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

  it "Must return a list of products sold at the Market" do
    expect(new_market.products).must_be_instance_of(Array)
    expect(new_market.products.length).must_equal(13)
  end

  it "Must return instances where Market name or Vendor name contain a search term" do
    expect(FarMar::Market.search("school").length).must_equal(3)
    name_array = FarMar::Market.search("school").map do |market|
      market.name
    end
    expect(name_array).must_include("Fox School Farmers Market")
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

  it "Must return instance of vendor traced by product" do
    expect(new_product.vendor).must_be_instance_of(FarMar::Vendor)
    expect(new_product.vendor.name).must_equal("Feil-Farrell")
  end

  it "Must return all instances of sales of specified product and number of sales" do
    expect(new_product.sales).must_be_instance_of(Array)
    expect(new_product.number_of_sales).must_equal(7)
  end

  it "Must return list of products sold at a vendor (traced by id)" do
    expect(FarMar::Product.by_vendor(3)).must_be_instance_of(Array)
    expect(FarMar::Product.by_vendor(3)[0].name).must_equal("Yummy Fruit")
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

  it "Must return instance of vendor traced by vendor_id in sale" do
    expect(new_sale.vendor).must_be_instance_of(FarMar::Vendor)
    expect(new_sale.vendor.name).must_equal("Feil-Farrell")
  end

  it "Must return instance of product traced by product_id in sale" do
    expect(new_sale.product).must_be_instance_of(FarMar::Product)
    expect(new_sale.product.name).must_equal("Dry Beets")
  end

  it "Must return instances of sales made between defined time limits" do
    time_a = DateTime.parse("2013-11-07 04:30:00 -0800").to_time
    time_b = DateTime.parse("2013-11-07 05:00:00 -0800").to_time
    sales_array = FarMar::Sale.between(time_a, time_b)
    expect(sales_array).must_be_instance_of(Array)
    expect(sales_array[0].purchase_time >= time_a && sales_array[0].purchase_time <= time_b).must_equal(true)
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

  it "Must return instance of market traced by market_id in vendor" do
    expect(new_vendor.market).must_be_instance_of(FarMar::Market)
    expect(new_vendor.market.name).must_equal("People's Co-op Farmers Market")
  end

  it "Must return all instances of products sold by vendor" do
    expect(new_vendor.products).must_be_instance_of(Array)
    expect(new_vendor.products.length).must_equal(1)
  end

  it "Must return all vendor sales & total revenue" do
    expect(new_vendor.sales).must_be_instance_of(Array)
    expect(new_vendor.sales.length).must_equal(7)
    expect(new_vendor.revenue).must_equal(9290+2262+9588+1634+4440+6950+4095)
  end

  it "Must return list of vendors traced by market_id in vendor" do
    expect(FarMar::Vendor.by_market(1)).must_be_instance_of(Array)
    expect(FarMar::Vendor.by_market(1).length).must_equal(6)
  end

end
