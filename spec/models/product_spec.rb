require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "should successfully save" do
      product = Product.new
      product.name = "testname"
      product.price = 12.99
      product.quantity = 35
      product.category = Category.new
      expect(product).to be_valid
    end

      it "should successfully save" do
      product = Product.new
      product.name = nil
      product.price = 12.99
      product.quantity = 35
      product.category = Category.new
      expect(product).not_to be_valid
    end

      it "should successfully save" do
      product = Product.new
      product.name = "testname"
      product.price = nil
      product.quantity = 35
      product.category = Category.new
      expect(product).not_to be_valid
    end

      it "should successfully save" do
      product = Product.new
      product.name = "testname"
      product.price = 12.99
      product.quantity = nil
      product.category = Category.new
      expect(product).not_to be_valid
    end

      it "should successfully save" do
      product = Product.new
      product.name = "testname"
      product.price = 12.99
      product.quantity = 35
      product.category = nil
      expect(product).not_to be_valid
    end
  end
end
