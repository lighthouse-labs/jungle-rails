require 'bcrypt' 
class User < ActiveRecord::Base
    has_secure_password

    has_many :reviews
    
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false }
    validates :password, length: { minimum: 4 }, presence: true
    validates :password_confirmation, presence: true

end
