require 'rails_helper'

RSpec.describe User, type: :model do
  
  before(:each) do
    @user = User.new(first_name: 'Britney', last_name: 'Spears', email: 'test@gmail.COM', password:'bambie', password_confirmation:'bambie')
  end
  
  describe '(validations)' do

    it 'password fields should match' do
      user = User.new(
        first_name: 'Britney',
        last_name: 'Spears',
        email: 'britney@gmail.com',
        password: '1234',
        password_confirmation: '123'
      )
      expect(user.valid?).to be false
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'email should be unique' do
      @user.save
      @user1 = User.new(first_name: 'Sarah', last_name: 'Ye', email: 'TEST@GMAIL.com', password: '1122', password_confirmation: '1122')
      expect(@user1.valid?).to be false
      expect(@user1.errors.full_messages).to include("Email has already been taken")
    end

    it 'password should have at least 5 characters' do
      user = User.new(
        first_name: 'Britney',
        last_name: 'Spears',
        email: 'britney@gmail.com',
        password: '1234',
        password_confirmation: '1234'
      )
      expect(user.valid?).to be false
      expect(user.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
    end
  end

  describe '.authenticate_with_credentials' do  
    it 'should not care about case when searching by email' do
      @user.save
      expect(User.find_by_email_ignore_case('tesT@Gmail.com')).to_not eql(nil)
    end
    
    it 'should have authenticated email and password' do
      @user.save
      expect(User.authenticate_with_credentials(' test@gmAil.COM', 'bambie')).to_not eql(nil)
    end
  end
end
