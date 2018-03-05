class User < ActiveRecord::Base

  has_secure_password
  has_many :reviews

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true, confirmation: true, :length => {:within => 6..40}
  validates :password_confirmation, presence: true

  validates :email, :uniqueness => {:case_sensitive => false}

end
