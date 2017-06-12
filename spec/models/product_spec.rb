require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before :each do
      @category = Category.new
    end
    it "should save successfully" do
      product = Product.new category: @category, name: "shirt", price: 34.50, quantity: 3, image: "imagelink.com", description: "cool shirt"
      product.save
      # expect(product).to be_present
      expect(product).to be_an_instance_of(Product)
    end

    it "should give an error when category is not set" do
      product = Product.new name: "shirt", price: 34.50, quantity: 3
      product.save
      expect(product.valid?).to be_falsey
    end
    it "should give an error when price is not set" do
      product = Product.new name: "shirt", category: @category, quantity: 3
      product.save
      expect(product.valid?).to be_falsey
    end
    it "should give an error when quantity is not set" do
      product = Product.new name: "shirt", price: 34.50, category: @category
      product.save
      expect(product.valid?).to be_falsey
    end
    it "should give an error when name is not set" do
      product = Product.new category: @category, price: 34.50, quantity: 3
      product.save
      expect(product.errors.full_messages).to include("Name can't be blank")
    end
  end
end
