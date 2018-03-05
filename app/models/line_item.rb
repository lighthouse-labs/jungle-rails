class LineItem < ActiveRecord::Base
  after_create :decrease_quantity
  belongs_to :order
  belongs_to :product

  monetize :item_price_cents, numericality: true
  monetize :total_price_cents, numericality: true

  private
  def decrease_quantity
    quantity = self.quantity
    product = Product.find(self.product.id)
    product.decrement!(:quantity, quantity)

  end
end
