require 'rails_helper'

RSpec.describe Product, type: :model do
  before :all do
    @cat1 = Category.new(name: 'Electronics')
  end

  # before :each do
  #   # run script in each validation
  # end

  describe 'Validations' do

    it "if is valid with all fields" do
      @product = @cat1.products.new(name: "watch", price: 19.99, quantity: 10)
      expect(@product).to be_valid
    end

    it "is not valid without a name" do
      @product = @cat1.products.new(name: nil, price: 19.99, quantity: 10)
      expect(@product).to_not be_valid
    end

    it "is not valid without a price" do
      cat1 = Category.new(name: 'Electronics')
      @product = @cat1.products.new(name: "watch", price: nil, quantity: 10)
      expect(@product).to_not be_valid
    end

    it "is not valid without a quantity" do
      cat1 = Category.new(name: 'Electronics')
      @product = cat1.products.new(name: "watch", price: 19.99, quantity: nil)
      expect(@product).to_not be_valid
    end

    it "is not valid without a category" do
      
      @product = Product.new(name: "watch", price: 19.99, quantity: 10)
      expect(@product).to_not be_valid
    end

  end
end



# validates :name, presence: true
# validates :price, presence: true
# validates :quantity, presence: true
# validates :category, presence: true
