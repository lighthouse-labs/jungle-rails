class Review < ActiveRecord::Base

  belongs_to :product
  has_one :user

end
