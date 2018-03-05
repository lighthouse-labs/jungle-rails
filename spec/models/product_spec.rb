require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'a product is valid having name, price, quantity and cateogry' do
      category = Category.new(name: 'Furnishings')
      product = Product.new(name: 'Table', price: 2500, quantity: 5, category: category)
      expect(product).to be_valid
    end
    it 'should have a name' do
      product = Product.new(name: nil, price: 2500, quantity: 5, category: category)
      expect(product).to_not be_valid
    end
    it 'should have a price' do
      product = Product.new(name: 'Table', price: nil, quantity: 5, category: category)
      expect(product).to_not be_valid
    end
    it 'should have a quantity' do
      product = Product.new(name: 'Table', price: 2500, quantity: nil, category: category)
      expect(product).to_not be_valid
    end
    it 'should have a category' do
      product = Product.new(name: 'Table', price: 2500, quantity: 5, category: nil)
      expect(product).to_not be_valid
    end
  end

end
