class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews

  before_validation :downcase_email

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 5 }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    email.strip!
    email.downcase!
    user = User.find_by_email(email)
    (user && user.authenticate(password)) ? user : nil
  end

  private

  def downcase_email
    self.email = email.downcase if email.present?
  end

end
