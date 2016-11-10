class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence:true
  validates :password, length: {minimum: 8}
  validate :password_confirmed?

  private

  def password_confirmed?
    password == confirm_password
  end
end


# need email validator