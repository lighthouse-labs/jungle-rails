class User < ActiveRecord::Base
    has_secure_password

    validates :password, length: { minimum: 6 }
    validates :username, presence: true, length: { maximum: 20 }, uniqueness: true

end
