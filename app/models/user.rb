class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8}
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    email_stripped_downcase = email.strip.downcase
    user = User.where("email = ?", email_stripped_downcase).first

    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

end
