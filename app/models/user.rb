class User < ActiveRecord::Base
    validates_uniqueness_of :email, confirmation: { case_sensitive: false }
    validates :password, length: {minimum: 6}
    has_secure_password 

    def self.authenticate_with_credentials(email, password)
        user = User.find_by(email: "#{email}")
        user.authenticate(password)
    end
    
end
