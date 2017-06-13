class User < ActiveRecord::Base
  has_many :reviews
  validates :email, :uniqueness => {:case_sensitive => false}
  # gives our User model authentication methods via bcrypt.
  validates :password, presence: true, length: {minimum: 6}
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password_confirmation, presence: true
  has_secure_password
  before_save :downcase_strip_email

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase!)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

  def downcase_strip_email
    self.email.downcase!
  end
end
