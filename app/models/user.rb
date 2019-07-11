# app/models/user.rb

class User < ActiveRecord::Base

  has_secure_password

end