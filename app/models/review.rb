class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :description, length: {minimum: 1}
  validates :rating, numericality: true, presence: true
  validate :is_there_product?
  # validate :is_logged_in?
  private
  def is_there_product?
  # is there a product to attach a review too
    self.product_id ? true : errors.add(:is_there_product?, "Cannot review a product that doesn't exist!")
  end

  def is_logged_in?
    self.user_id ? true : errors.add(:user, "must be logged in!")
  end
end

# need to check validation on front end