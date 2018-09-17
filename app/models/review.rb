class Review < ActiveRecord::Base

  belongs_to :product
  belongs_to :user

  validates :description, presence: true, length: { minimum: 5 }
  validates :rating, presence: true, numericality: true
  validates :user_id, presence: true
  validates :product_id, presence: true
  
end
