require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it "validates both password and password_confirmation fields' presence" do
      u1 = User.new({
        first_name: 'Jade',
        last_name: 'Marmalade',
        email: 'jademarmalade@gmail.com',
        password: '',
        password_confirmation: ''
      })
      u1.valid?
      expect(u1.errors.full_messages).to include("Password can't be blank") && include("Password confirmation can't be blank")
    end

    it "validates password and password_confirmation match" do
      u2 = User.new({
        first_name: 'Jade',
        last_name: 'Marmalade',
        email: 'jademarmalade@gmail.com',
        password: 'password',
        password_confirmation: 'paswsord'
      })
      u2.valid?
      expect(u2.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "validates case insensitive uniqueness of email" do
      u3 = User.new({
        first_name: 'Jade',
        last_name: 'Marmalade',
        email: 'jademarmalade@gmail.com',
        password: 'password',
        password_confirmation: 'password'
      })
      u3.save
      u4 = User.new({
        first_name: 'Jade',
        last_name: 'Marmalade',
        email: 'Jademarmalade@gmail.com',
        password: 'password',
        password_confirmation: 'password'
        })
      u4.valid?
      expect(u4.errors.full_messages).to include("Email has already been taken")
    end

    it "validates first_name, last_name, and email's presence" do
      u5 = User.new({
        first_name: '',
        last_name: '',
        email: '',
        password: 'password',
        password_confirmation: 'password'
      })
      u5.valid?
      expect(u5.errors.full_messages).to include("First Name can't be blank") && include("Last Name can't be blank") &&  include("Email can't be blank")
    end

    it "validates password must have a minimum length of 5" do
      u6 = User.new({
        first_name: 'Jade',
        last_name: 'Marmalade',
        email: 'jademarmalade@gmail.com',
        password: 'pass',
        password_confirmation: 'pass'
        })
      u6.valid?
      expect(u6.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
    end


  end
end