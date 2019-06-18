require 'rails_helper'

RSpec.describe Product, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe 'Validations' do
  before do
    @cat1 = Category.create!({name: 'Apparel'})
    @product1 = Product.new({name: nil, price: 9.99, quantity: 5, category: @cat1})
    @product2 = Product.new({name: "tester", price: nil, quantity: 5, category: @cat})
    @product3 = Product.new({name: "tester", price: 9.99, quantity: nil, category: @cat1})
    @product4 = Product.new({name: "tester", price: 9.99, quantity: 5, category: nil})
  end
  
  it "nil name will throw error" do
    @product1.save
    expect(@product1.errors.full_messages).to_not be_nil
    end

    it "nil price will throw error" do
      @product2.save
      expect(@product2.errors.full_messages).to_not be_nil
    end

    it "nil quantity will throw error" do
      @product3.save
      expect(@product3.errors.full_messages).to_not be_nil
    end

    it "nil category will throw error" do
      @product4.save
      expect(@product4.errors.full_messages).to_not be_nil
    end 
  end
end

