class User < ActiveRecord::Base

  before_validation :downcase_email

  validates :email, presence: true, uniqueness: true

  validates :password, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true



  has_many :reviews
  has_secure_password

  private

  def downcase_email
    self.email = email.downcase if email.present?
  end

end