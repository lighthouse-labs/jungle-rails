class User < ActiveRecord::Base
  has_secure_password

  has_many :review

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  validates_confirmation_of :password, message: 'should match confirmation'

end