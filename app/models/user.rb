class User < ActiveRecord::Base
  has_secure_password
  validates :email, :uniqueness => {:case_sensitive => false}
  validates :first_name, :last_name, :email, :password, :password_confirmation, presence: true
end
