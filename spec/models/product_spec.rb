require 'rails_helper'

RSpec.describe Product, type: :model do

  before(:each) do
    @category = Category.new name:'Apparel'
  end

  describe 'Validations' do
    it "is valid with valid attributes" do
      @product_params = Product.new(name:'name', category:@category, quantity:5, price:100)
      expect(@product_params).to be_valid
    end

    it 'is not valid without a name' do 
      @product = Product.new(category:@category, quantity:5, price:100)
      expect(@product).to_not be_valid
    end
    it 'is not valid without a price' do 
      @product = Product.new( name:'name', category:@category, quantity:5)
      expect(@product).to_not be_valid
    end
    it 'is not valid without a quantity' do 
      @product = Product.new(name:'name', category:@category, price:100)
      expect(@product).to_not be_valid
    end
    it 'is not valid without a category' do 
      @product = Product.new(name:'name', quantity:5, price:100)
      expect(@product).to_not be_valid
    end
  end
end