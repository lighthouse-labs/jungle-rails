require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save without a problem' do
      category = Category.create(name: 'test')
      product = Product.create(
        name: 'prod1',
        price_cents: 100,
        quantity: 4,
        category_id: category.id,
        description: "the desc"
        )
      expect(product).to be_persisted
    end

    it 'should fail due to lack of name' do
      category = Category.create(name: 'test')
      product = Product.create(
        name: nil,
        price_cents: 100,
        quantity: 4,
        category_id: category.id,
        description: "the desc"
        )
      expect(product).to_not be_persisted
    end

    it 'should fail due to lack of price' do
      category = Category.create(name: 'test')
      product = Product.create(
        name: 'prod1',
        price_cents: nil,
        quantity: 4,
        category_id: category.id,
        description: "the desc"
        )
      expect(product).to_not be_persisted
    end

    it 'should fail due to lack of category_id' do
      category = Category.create(name: 'test')
      product = Product.create(
        name: 'prod1',
        price_cents: 100,
        quantity: 4,
        category_id: nil,
        description: "the desc"
        )
      expect(product).to_not be_persisted
    end

    it 'should fail due to lack of quantity' do
      category = Category.create(name: 'test')
      product = Product.create(
        name: 'prod1',
        price_cents: 100,
        quantity: nil,
        category_id: category.id,
        description: "the desc"
        )
      expect(product).to_not be_persisted
    end
  end
end
