class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email, :case_sensitive => false
  validates :password, presence: true
  validates_length_of :password, :minimum => 5

  def self.find_by_email_ignore_case(email)
    User.where("lower(email) = ?", email.downcase).first
  end

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email_ignore_case(email.strip)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
  

end
