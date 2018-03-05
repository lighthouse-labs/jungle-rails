class User < ActiveRecord::Base

  before_save :downcase_fields

  has_secure_password
  has_many :reviews

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true, confirmation: true, :length => {:within => 6..40}
  validates :password_confirmation, presence: true

  validates :email, :uniqueness => {:case_sensitive => false}

  def authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(password)
      return user
    end
    nil
  end
  
  def downcase_fields
    self.email.downcase!
  end

end
