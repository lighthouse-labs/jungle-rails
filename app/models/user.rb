class User < ActiveRecord::Base

  has_secure_password

  validates :email, uniqueness: true
  validates :password, length: {minimum: 5}
  validates :first_name, :last_name, :email,:password, :password_confirmation, presence: true


  def self.authenticate_with_credentials(email,password)
    usable_email = email.delete(' ')
    user = User.find_by(email: usable_email.downcase)
    puts user.password_digest
    puts user.authenticate(password)
    if user.authenticate(password)
      return true
    else
      return false
    end
  end

end
