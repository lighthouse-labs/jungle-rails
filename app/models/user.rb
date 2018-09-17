class User < ActiveRecord::Base
  has_secure_password
  validates :email, :uniqueness => {:case_sensitive => false}
  validates :password, :length => {:minimum => 6}
  validates :first_name, :last_name, :email, :password, :password_confirmation, presence: true
end
