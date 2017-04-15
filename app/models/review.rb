class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user


  validates_associated :product
  validates :user_id, presence: true
  validates :description, presence: true
  validates :rating, presence: true

end
