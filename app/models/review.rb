class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :description, presence: true
  validates :rating, numericality: { only_integer: true, less_than: 6 }
end
