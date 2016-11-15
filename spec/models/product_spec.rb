require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    ##TRUE CHECKS

    it "is valid with valid attributes" do
      @category = Category.new
      @product = Product.new({
        name: "Name",
        price: 50.00,
        quantity: 10,
        category: @category
      })
      expect(@product.save).to be true
      expect(@product.errors.full_messages.empty?).to be true
    end

    ##FALSE CHECKS

    it "is false with no name" do
      @category = Category.new
      @product = Product.new({
        name: nil,
        price: 50.00,
        quantity: 10,
        category: @category
      })
      expect(@product.save).to be false
      expect(@product.errors.full_messages).to include "Name can't be blank"
    end

    it "is not valid without a price" do
      @category = Category.new
      @product = Product.new({
        name: "Name",
        price: nil,
        quantity: 10,
        category: @category
      })
      expect(@product.save).to be false
      expect(@product.errors.full_messages).to include "Price is not a number"
    end

    it "is not valid without a quantity" do
      @category = Category.new
      @product = Product.new({
        name: "Name",
        price: 50.99,
        quantity: nil,
        category: @category
      })
      expect(@product.save).to be false
      expect(@product.errors.full_messages).to include "Quantity can't be blank"
    end

    it "is not valid without a category" do
      @category = Category.new
      @product = Product.new({
        name: "Name",
        price: 50.99,
        quantity: 10,
        category: nil
      })
      expect(@product.save).to be false
      expect(@product.errors.full_messages).to include "Category can't be blank"
    end
  end
end
