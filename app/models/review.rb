class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validates :description, :rating, :user_id, :product_id, presence: true
end
