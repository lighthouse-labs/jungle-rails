class Review < ActiveRecord::Base
  validates :product_id, presence: true
  validates :user_id, presence: true
  validates :description, presence: true
  validates :rating, presence: true
  belongs_to :product
  belongs_to :user
end
