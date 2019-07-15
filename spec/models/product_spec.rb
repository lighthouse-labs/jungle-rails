require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
    describe 'Validations' do

    it 'should not let a product be created without a name' do
      @cat_test = Category.create name:"Electronics"

      @product  = @cat_test.products.new quantity:2, price:7888
      expect(@product.name).to be_nil
    end

    it 'should let a product be created a name' do
      @cat_test = Category.create name:"Electronics"
      @product  = @cat_test.products.new name:"Phone", quantity:2, price:7888
      expect(@product.name).to be_present
    end

    it 'should not let a product be created without a price' do
      @cat_test = Category.create name:"Electronics"
      @product  = @cat_test.products.new 
      expect(@product.price).to be_nil
    end

    it 'should let a product be created a price' do
      @cat_test = Category.create name:"Electronics"
      @product  = @cat_test.products.new name:"Phone", quantity:2, price:7888
      expect(@product.price).to be_present
    end

    it 'should not let a product be created without a quantity' do
      @cat_test = Category.create name:"Electronics"
      @product  = @cat_test.products.new 
      expect(@product.quantity).to be_nil
    end

    it 'should let a product be created a quantity' do
      @cat_test = Category.create name:"Electronics"
      @product  = @cat_test.products.new name:"Phone", quantity:2, price:7888
      expect(@product.quantity).to be_present
    end

    it 'should not let a product be created without a category' do
      # @cat_test = Category.create 
      @product  = Product.new 
      expect(@product.category_id).to be_nil
    end

    it 'should let a product be created under a category' do
      @cat_test = Category.create name:"Electronics"
      @product  = @cat_test.products.new name:"Phone", quantity:2, price:7888
      expect(@product.category_id).to be_present
    end

    it 'should not let a product to be created' do
      @cat_test = Category.create name:"Electronics"
      @product  = @cat_test.products.new 
      expect(@product).not_to be_persisted
    end

    it 'should check if product can be created' do
      @cat_test = Category.create name:"Electronics"
      @product  = @cat_test.products.new name:"Phone", quantity:2, price:7888
      expect(@product).to be_present
    end

  end
end