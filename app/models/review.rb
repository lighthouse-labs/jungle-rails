class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

   validates :product_id, presence: true
end
