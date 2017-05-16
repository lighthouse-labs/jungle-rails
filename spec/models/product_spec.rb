require 'rails_helper'

RSpec.describe Product, type: :model do

  before(:each) do
    @category = Category.new(name: 'furniture')
    @product = Product.new(name: 'long chair', price_cents: 6000, quantity: 5, category: @category)
  end

  describe 'Validations' do
    it 'product should be saved' do
      @product.save
    end
    
    it 'should validate the presence of name' do
      @product.name = nil
      expect(@product.valid?).to be false
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should validate the presence of price' do
      @product.price_cents = nil
      expect(@product.valid?).to be false
      expect(@product.errors.full_messages).to include("Price cents is not a number", "Price is not a number", "Price can't be blank")
    end

    it 'should validate the presence of quantity' do
      @product.quantity = nil
      expect(@product.valid?).to be false
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should validate the presence of category' do
      @product.category = nil
      expect(@product.valid?).to be false
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
  # describe 'Validations with shoulda matcher' do
    # it { is_expected.to validate_presence_of(:name) }
    # it { is_expected.to validate_presence_of(:price_cents) }
    # it { is_expected.to validate_presence_of(:quantity) }
    # it { is_expected.to validate_presence_of(:category) }
  # end
end
