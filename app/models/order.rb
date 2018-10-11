class Order < ActiveRecord::Base

  belongs_to :user
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

  after_create :send_receipt

  def send_receipt
    OrderMailer.send_receipt(id).deliver_later
  end
end
