require 'bcrypt' 
class User < ActiveRecord::Base
    has_secure_password

    has_many :reviews

    validates :password, length: { minimum: 6 }
    validates :email, presence: true, length: { maximum: 20 }, uniqueness: true

end
