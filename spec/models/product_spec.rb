require 'rails_helper'

RSpec.describe Product, type: :model do

  context "Validations" do

    it "Product with all four fields will save successfully" do
      @category = Category.new(name: "Men's Apparel")
      @product = Product.new(
        name: "Red Shoe",
        price: 30,
        quantity: 5,
        category: @category)


      expect(@product.name).to eq("Red Shoe")
      expect(@product.price).to eq(30)
      expect(@product.quantity).to eq(5)
      expect(@product.category).to eq(@category)
      expect(@product.errors.full_messages.size).to eq(0)
    end

    it "Name should be nil and return an error" do
      @category = Category.new(name: "Men's Apparel")
      @product = Product.new(
        name: nil,
        price: 30,
        quantity: 5,
        category: @category)

      expect(@product).to_not be_valid
      expect(@product.errors[:name].size).to eq(1)
    end

    it "Name should be nil and return an error" do
      @category = Category.new(name: "Men's Apparel")
      @product = Product.new(
        name: "just a shoe",
        price: nil,
        quantity: 5,
        category: @category)

      expect(@product).to_not be_valid
      expect(@product.errors[:price].size).to eq(2)
    end

    it "Name should be nil and return an error" do
      @category = Category.new(name: "Men's Apparel")
      @product = Product.new(
        name: "just a shoe",
        price: 30,
        quantity: nil,
        category: @category)

      expect(@product).to_not be_valid
      expect(@product.errors[:quantity].size).to eq(1)
    end

    it "Name should be nil and return an error" do
      @category = Category.new(name: "Men's Apparel")
      @product = Product.new(
        name: "just a shoe",
        price: 30,
        quantity: 5,
        category: nil)

      expect(@product).to_not be_valid
      expect(@product.errors[:category].size).to eq(1)
    end

  end
end