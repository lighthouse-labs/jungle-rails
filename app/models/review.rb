class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validates :description, :rating, :product_id, :user_id, presence: true
  validates :rating, numericality: {
                                    greater_than: 0,
                                    less_than_or_equal_to: 5
                                  }
end
