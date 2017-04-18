require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'should persist if all fields with validations are entered correctly' do
      cat4 = Category.create! name: 'Food'
      p1 = cat4.products.create!({
        name:  'Falafel Machine',
        description: 'description',
        quantity: 18,
        price: 119.99
      })
      expect(p1).to be_persisted
    end

    it 'should validate name' do
      cat4 = Category.create! name: 'Food'
      p2 = cat4.products.new({
        description: 'description',
        quantity: 18,
        price: 119.99
      })
      p2.valid?
      expect(p2.errors.full_messages).to include("Name can't be blank")
    end

    it 'should validate price' do
      cat4 = Category.create! name: 'Food'
      p3 = cat4.products.new({
        name:  'Falafel Machine',
        description: 'description',
        quantity: 18
      })
      p3.valid?
      expect(p3.errors.full_messages).to include("Price can't be blank")
    end

    it 'should validate quantity' do
      cat4 = Category.create! name: 'Food'
      p4 = cat4.products.new({
        name:  'Falafel Machine',
        description: 'description',
        price: 119.99
      })
      p4.valid?
      expect(p4.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should validate category' do
      p5 = Product.new({
        name:  'Falafel Machine',
        description: 'description',
        price: 119.99
      })
      p5.valid?
      expect(p5.errors.full_messages).to include("Category can't be blank")
    end

  end
end