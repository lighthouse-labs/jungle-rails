class User < ActiveRecord::Base
  has_many :reviews
  # gives our User model authentication methods via bcrypt.
  has_secure_password
end
