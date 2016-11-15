class User < ActiveRecord::Base
  has_secure_password
  has_many :ratings
  validates :first, :last, :email , presence: true
  validates_uniqueness_of :email, :case_sensitive => false
  validates :password_digest, presence: true
  validates :password, presence: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true


  def self.authenticate_with_credentials(email, password)
    email_ready = email.downcase.strip
    user = self.find_by_email(email_ready)
    if user && user.authenticate(password)
       user
    end
  end
end
