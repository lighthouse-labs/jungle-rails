require 'rails_helper'

RSpec.describe Product, type: :model do

  context "Validations" do
    it 'should save succefully' do
      @category = Category.create(name:'Toys')
      @product = Product.create(name:'bestToy',price: 10, quantity:11, category_id: @category.id)
      expect(@product.name).to eq('bestToy')
      expect(@product.price).to eq(10)
      expect(@product.quantity).to eq(11)
      expect(@product.category_id).to eq(@category.id)
    end

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:quantity) }
    it { should validate_presence_of(:category_id) }
  end
end

