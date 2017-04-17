require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @category = Category.create name: 'Test Category'
    end

    it 'should save a new @product' do
      @product = @category.products.create(
        category_id: @category.id,
        name: 'Test Name',
        price: 9999.99,
        quantity: 20
      )
      expect(@product).to be_persisted
    end

    it 'should not save without a name' do
      @product = @category.products.create(
        name: nil,
        price: 9999.99,
        quantity: 20
      )
      puts @product.errors.full_messages
      expect(@product).to_not be_valid
    end

    it 'should not save without a price' do
      @product = @category.products.create(
        name: 'Test Name',
        price: nil,
        quantity: 20
      )
      puts @product.errors.full_messages
      expect(@product).to_not be_valid
    end

    it 'should not save without a quantity' do
      @product = @category.products.create(
        name: 'Test Name',
        price: 9999.99,
        quantity: nil
      )
      puts @product.errors.full_messages
      expect(@product).to_not be_valid
    end

    it 'should not save without a category' do
      @product = Product.new(
        category: nil,
        name: 'test name',
        price: 9999.99,
        quantity: 20
      )
      puts @product.errors.full_messages
      expect(@product).to_not be_valid
    end
  end
end
