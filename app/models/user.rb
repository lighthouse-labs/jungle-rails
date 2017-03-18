class User < ActiveRecord::Base
  has_many :reviews
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, case_sensitive: false
  validates :password, presence: true
  has_secure_password
end
