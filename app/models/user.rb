class User < ActiveRecord::Base
  has_secure_password
  has_many :review

  validates :password, presence: true, length: { minimum: 5 }
  validates :password_confirmation, presence: true
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  def self.authenticate_with_credentials(email, password)
    email = email.strip
    user = User.where('lower(email) = ?', email.downcase).first
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end
