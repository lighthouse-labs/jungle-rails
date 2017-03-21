class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews
  validates_associated :email, uniqueness: true
end