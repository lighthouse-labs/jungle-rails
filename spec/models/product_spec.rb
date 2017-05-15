require 'rails_helper'

RSpec.describe Product, type: :model do

  before(:each) do
    @category = Category.new(name: 'furniture')
    @product = Product.new(name: 'long chair', price_cents: 6000, quantity: 5, category: @category)
  end

  describe 'Validations' do
    it 'product should be saved' do
      @product.save
      p @product  #print out the fields of product
    end
    
    it 'should validate the presence of name' do
      @product.name = nil
      p @product.valid?
      p @product.errors.full_messages
    end

    it 'should validate the presence of price' do
      @product.price_cents = nil
      p @product.valid?
      p @product.errors.full_messages
    end

    it 'should validate the presence of quantity' do
      @product.quantity = nil
      p @product.valid?
      p @product.errors.full_messages
    end

    it 'should validate the presence of category' do
      @product.category = nil
      p @product.valid?
      p @product.errors.full_messages
    end
  end
  # describe 'Validations with shoulda matcher' do
    # it { is_expected.to validate_presence_of(:name) }
    # it { is_expected.to validate_presence_of(:price_cents) }
    # it { is_expected.to validate_presence_of(:quantity) }
    # it { is_expected.to validate_presence_of(:category) }
  # end
end
