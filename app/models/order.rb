class Order < ActiveRecord::Base

  belongs_to :user
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

  def name
    product.name
  end

  def image
    product.image
  end
  
  def description
    product.description
  end
end