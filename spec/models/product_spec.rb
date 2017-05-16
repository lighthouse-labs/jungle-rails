require 'rails_helper'

RSpec.describe Product, type: :model do

  before do
    @category = Category.new
    @product = Product.new(name: "t-shirt", price: 100, quantity: 10, category: @category)
  end


  describe 'Validations' do
    it "should be valid" do
        @product.valid?
        expect(@product.valid?).to be true
    end

    it "should have a name" do
      @product.name = nil
      expect(@product.valid?).to be false
    end

    it "should have a price" do
      @product.price = ""
      expect(@product.valid?).to be false
    end

    it "should have a quantity" do
      @product.quantity = nil
      expect(@product.valid?).to be false
    end

    it "should have a category" do
      @product.category = nil
      expect(@product.valid?).to be false
    end

    # another way to write the test
    # it "should have a name" do
    #   product = Product.create(:name => nil)
    #   expect(product.errors).to have_key(:name)
    # end

    # it "should have a price" do
    #   product = Product.create(:price => nil)
    #   #product.valid?
    #   expect(product.errors).to have_key(:price)
    # end

    # it "should have a quantity" do
    #   product = Product.create(:quantity => nil)
    #   #product.valid?
    #   expect(product.errors).to have_key(:quantity)
    # end

    # it "should have a category" do
    #   product = Product.create(:category => nil)

    #   expect(product.errors).to have_key(:category)
    # end

  end

end
