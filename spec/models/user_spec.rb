require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it 'should let a user be created if password and password_confirmation match' do
      @user = User.create password:'astest', password_confirmation:'astest'
      expect(@user.password).to eq(@user.password_confirmation)
    end
    it 'should require a first name' do
      @user = User.create first_name:'a',last_name:'s',email:'a@test.com'
      expect(@user.first_name).to be_present
    end
    it 'should require a last name' do
      @user = User.create first_name:'a',last_name:'s',email:'a@test.com'
      expect(@user.last_name).to be_present
    end
    it 'should require an email' do
      @user = User.create first_name:'a',last_name:'s',email:'a@test.com'
      expect(@user.email).to be_present
    end
  end
end
