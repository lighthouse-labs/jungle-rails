class Rating < ActiveRecord::Base
  validates :user_id, presence: true
  validates :product_id, presence: true
  validates :rating, presence: true
  
end
