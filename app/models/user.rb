class User < ActiveRecord::Base
  # attr_accessor :email, :last_name, :first_name, :password, :password_confirmation
  #EMAIL_REGEX = /^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$/i
#{  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }}
  # validates :first_name, :presence => true
  # validates :last_name, :presence => true
  # validates :email, :presence => true   #, :uniqueness => true, :format => EMAIL_REGEX
  # validates :password, :confirmation => true #password_confirmation attr
  # validates_length_of :password, :in => 6..32, :on => :create

  has_secure_password
end