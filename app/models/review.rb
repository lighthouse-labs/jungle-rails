class Review < ActiveRecord::Base

  belongs_to :product
  belongs_to :user

  validates :product_id, presence: true
  validates :user_id, presence: true
  validates :description, length: { minimum: 2 }
  validates :rating, presence: true
end
