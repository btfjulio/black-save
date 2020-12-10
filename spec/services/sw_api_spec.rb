require 'rails_helper'

RSpec.describe SwApi, type: :model do

  before(:each) do 
    @service = described_class.new
    @service.call 
  end
  
  context "when #call" do 
    
    it "should set a list of offers" do
      expect(@service.products).not_to be_nil
    end

    it "should have a list of 25 examples" do
      products = @service.products
      expect(products.count).to eq 25
    end
  end
  
  context "when #create_offers" do
    it "should create 25 instances of offers" do
      expected_count = @service.products.count
      expect do 
        @service.create_offers 
      end.to change(Offer, :count).by(expected_count) 
    end
  end

  context "when #random_sup" do
    it "should return an product hash example" do
      product = @service.random_sup
      expected_keys = %i(title body coupon price link)
      expect(product).to include(*expected_keys)
    end

    it "should exclude selected example from products collection" do
      product = @service.random_sup
      expect(@service.products).not_to include(product)
    end
  end


end