#FarMar_spec.rb

require_relative 'Spec_helper'
require_relative '../lib/FarMar_Market'
require_relative '../lib/FarMar_Vendor'
require_relative '../lib/FarMar_Product'
require_relative '../lib/FarMar_Sale'


describe 'Testing FarMar' do

  ##########------------------- Baseline ------------------------##########

  it "Must return Market class" do
    expect(FarMar::Market.new.class).must_equal(FarMar::Market)
  end

end
