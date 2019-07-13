class Review < ActiveRecord::Base

    belong_to :product
    belongs_to :user

    validates
    validates :product_id
    validates :description
    validates :rating
end
