class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews

  validates :password, length: {minimum: 4}, presence: true
  validates :email, uniqueness: {:case_sensitive => false}
  validate :password_matches

  def password_matches
    if password != password_confirmation
      errors.add(:password_confirmation, "has to match password")
    end
  end

  def self.authenticate_with_credentials(email, password)

    user = User.where('lower(email) = ?', email.downcase.strip).first
    if user.authenticate(password)
      return user
    else
      return nil
    end
  end
end
