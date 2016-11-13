class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  validates :rating, numericality: true, length: { in: 1..5 }
  validates :description, length: {minimum: 1, maximum: 255}
  validate :is_there_product?
  validate :is_logged_in?
  private
  def is_there_product?
  # is there a product to attach a review too
    self.product_id ? true : errors.add(:is_there_product?, "Cannot review a product that doesn't exist!")
  end

  def is_logged_in?
    self.user_id ? true : errors.add(:user, "must be logged in!")
  end
end

