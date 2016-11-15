require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "saves successfully when validation criteria met" do
      @category = Category.new
      @product = Product.new ({
        name: "Garbage.",
        price: 1234,
        quantity: 1,
        category: @category
        })
      expect(@product.save).to be true
    end

    it "does not save when Product.name is not provided" do
      @category = Category.new
      @product = Product.new ({
        name: nil,
        price: 1234,
        quantity: 1,
        category: @category
        })
      @product.save
      expect(@product.errors.full_messages).to include "Name can't be blank"
    end

    it "does not save when Product.price is not provided" do
      @category = Category.new
      @product = Product.new ({
        name: "Garbage",
        price: nil,
        quantity: 1,
        category: @category
        })
      @product.save

      expect(@product.errors.full_messages).to include "Price can't be blank"
    end

    it "does not save when Product.quantity is not provided" do
      @category = Category.new
      @product = Product.new ({
        name: "Garbage",
        price: 1234,
        quantity: nil,
        category: @category
        })
      @product.save
      expect(@product.errors.full_messages).to include "Quantity can't be blank"
    end

    it "does not save when Product.category is not provided" do
      @product = Product.new ({
        name: "Garbage",
        price: 1234,
        quantity: 1,
        category: nil
        })
      @product.save
      expect(@product.errors.full_messages).to include "Category can't be blank"
    end
  end
end

