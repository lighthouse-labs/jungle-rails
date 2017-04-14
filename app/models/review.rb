class Review < ActiveRecord::Base
  belongs_to :product

  validates_associated :product
  validate :user, presence: true
  validate :description, presence: true
  validate :rating, presence: true

end
