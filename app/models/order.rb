class Order < ActiveRecord::Base
# Belongs to relationship allows for line_item relationship
  belongs_to :user
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

end
