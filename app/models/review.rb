class Review < ActiveRecord::Base
  validates :rating, presence: true
  validates :description, presence: true

  belongs_to :user
  belongs_to :product

  validates :product, presence: true
  validates :user, presence: true
end
