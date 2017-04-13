require 'bcrypt'
class User < ActiveRecord::Base
  has_secure_password
end
