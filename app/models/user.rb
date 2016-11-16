class User < ActiveRecord::Base

  has_secure_password
  has_many :reviews, dependent: :destroy

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: {minimum: 4}
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    email = email.strip
    user = User.where('email = ?', email.downcase).first
      if user && user.authenticate(password)
        user
      end
  end
end
