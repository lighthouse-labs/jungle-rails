class User < ActiveRecord::Base
  has_secure_password
  before_validation :downcase_email

  validates :email, presence: true, uniqueness: true

  validates :password, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { minimum: 6, maximum: 20 }, on: :create


  has_many :reviews


  private

  def downcase_email
    self.email = email.downcase if email.present?
  end

  def self.authenticate_with_credentials(email, password)
    
    user = User.find_by_email(email)

    if user && user.authenticate(password)
      user
    else
      nil 
    end
  end
end