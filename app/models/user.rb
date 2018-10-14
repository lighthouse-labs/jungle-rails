class User < ActiveRecord::Base

  validates :email, uniqueness: true
  
  has_many :reviews
  has_secure_password

end