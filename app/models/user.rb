
class User < ActiveRecord::Base
  # has secure password validates password confirmation, presence
  #  and max length of 72 char
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence:true, uniqueness: true
  validates :password, length: {minimum: 1}

end


# need email validator