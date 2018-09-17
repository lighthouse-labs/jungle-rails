require 'rails_helper'

RSpec.describe Product, type: :model do

  before(:each) do
    @category = Category.new name:'Apparel'
    @product = Product.new
  end

  describe 'Validations' do
    it "is valid with valid attributes" do
      @product_params = Product.new(name:'name', category:@category, quantity:5, price:100)
      expect(@product_params).to be_valid
    end

    it 'is not valid without a name' do 
      expect(@product).to_not be_valid
    end
    it 'is not valid without a price' do 
      expect(@product).to_not be_valid
    end
    it 'is not valid without a quantity' do 
      expect(@product).to_not be_valid
    end
    it 'is not valid without a category' do 
      expect(@product).to_not be_valid
    end
  end
end