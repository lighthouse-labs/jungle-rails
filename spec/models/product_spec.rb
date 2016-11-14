require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe "Validations" do
    it "saves when all validations are met" do
      @cat = Category.new({name: "Kitty"})
      prod = Product.new({ name: "Tweezers", price: 5, quantity: 10, category: @cat })
      expect(prod.save).to be(true)
    end

    it "doesn't save without a name" do
      @cat = Category.new({name: "Kitty"})
      prod = Product.new({ name: nil, price: 5, quantity: 10, category: @cat })
      prod.save
      expect(prod.errors.full_messages).to include "Name can't be blank"
    end

    it "doesn't save without a price" do
      @cat = Category.new({name: "Kitty"})
      prod = Product.new({ name: "hoopla", price: nil, quantity: 10, category: @cat })
      prod.save
      expect(prod.errors.full_messages).to include "Price can't be blank"
    end

    it "doesn't save without a quantity" do
      @cat = Category.new({name: "Kitty"})
      prod = Product.new({ name: "hoopla", price: 20, quantity: nil, category: @cat })
      prod.save
      expect(prod.errors.full_messages).to include "Quantity can't be blank"
    end

    it "doesn't save without a category" do
      @cat = Category.new({name: "Kitty"})
      prod = Product.new({ name: "hoopla", price: 30, quantity: 10, category: nil })
      prod.save
      expect(prod.errors.full_messages).to include "Category can't be blank"
    end
  end
end
