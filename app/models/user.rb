class User < ActiveRecord::Base
    validates_uniqueness_of :email, confirmation: { case_sensitive: false }
    validates :password, length: {minimum: 6}
    has_secure_password 
end
