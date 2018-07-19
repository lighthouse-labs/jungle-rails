class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  validates :rating, presence: true
  validates :description, presence: true

end
