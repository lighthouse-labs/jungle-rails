require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'After creation' do
    before :each do
      @category = Category.new(name: 'Candy')
      @category2 = Category.new(name: 'Cake')
      # Setup at least two products with different quantities, names, etc
      @product1 = Product.create!(name: 'BubbleGum', quantity: 5, price: 100, category: @category)
      @product2 = Product.create!(name: 'Chocolate', quantity: 3, price: 105, category: @category)

      # Setup at least one product that will NOT be in the order
      @product3 = Product.create!(name: 'Cupcake', quantity: 6, price: 205, category: @category2)
    end
    # pending test 1
    it 'deducts quantity from products based on their line item quantities' do
      # TODO: Implement based on hints below
      # 1. initialize order with necessary fields (see orders_controllers, schema and model definition for what is required)
      @order = Order.new(email:'kvirani@gmail.com', stripe_charge_id: 'ch_1C2QgHCcRNoB0EmJhtRS3Isr', total_cents: 205)

      # 2. build line items on @order
      @line_item1 = @order.line_items.new(product_id: @product1.id, quantity: 1, item_price: 100, total_price: 100)
      @line_item2 = @order.line_items.new(product_id: @product2.id, quantity: 1, item_price: 105, total_price: 105)
      @order.save!
      # 3. save! the order - ie raise an exception if it fails (not expected)
      # 4. reload products to have their updated quantities
      @product1.reload
      @product2.reload
      # 5. use RSpec expect syntax to assert their new quantity values
      expect(@product1.quantity).to eq(4)
      expect(@product2.quantity).to eq(2)
    end
    # pending test 2
    it 'does not deduct quantity from products that are not in the order' do
      expect(@product3.quantity).to eq(6)
    end
  end
end
