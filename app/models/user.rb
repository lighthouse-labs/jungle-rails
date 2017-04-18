require 'bcrypt'
class User < ActiveRecord::Base

  has_secure_password
  has_many :reviews

  validates :first_name, :last_name, :email, presence: true
  validates_uniqueness_of :email, case_sensitive: false
  # has_secure_password automatically adds a confirmation to password?
  validates :password, :password_confirmation, presence: true
  validates :password, length: { in: 4..15 }

  def self.authenticate_with_credentials(email, password)
    # find the user after stripping the email of extra whitespace
    user = User.find_by_email(email.strip)

    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end
end
