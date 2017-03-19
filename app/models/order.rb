class Order < ActiveRecord::Base

  belongs_to :user
  has_many :line_items
  has_many :products, through: :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

  def order_total
    sum = 0
    line_items.each do |item|
      sum += item.total.price
    end
    sum
  end
end