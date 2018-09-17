require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do
    it 'is valid with valid attributes' do
    end
    
    it 'is not valid without a password' do
      @user = User.new(
        first_name:'John',
        last_name:'Smith',
        email:'johnsmith@gmail.com',
        password_confirmation:'hunter2')
      expect(@user).to_not be_valid
    end

    it 'is not valid without a password confirmation' do
      @user = User.new(
        first_name:'John',
        last_name:'Smith',
        email:'johnsmith@gmail.com',
        password:'hunter2')
      expect(@user).to_not be_valid
    end

    it 'is not valid without matching password and password confirmation' do
      @user = User.new(
        first_name:'John',
        last_name:'Smith',
        email:'johnsmith@gmail.com',
        password:'hunter2',
        password_confirmation:'differentpassword123')
      expect(@user).to_not be_valid
    end

    it 'is not valid without an email' do
      @user = User.new(
        first_name:'John',
        last_name:'Smith',
        password:'hunter2',
        password_confirmation:'hunter2')
      expect(@user).to_not be_valid
    end

    it 'is not valid without a unique email' do
      @first_user = User.create(
        first_name:'Joe',
        last_name:'Bloggs',
        email:'testingemail@gmail.com',
        password:'test',
        password_confirmation:'test')
        
      @second_user = User.new(
        first_name:'John',
        last_name:'Smith',
        email:'testingemail@gmail.com',
        password:'hunter2',
        password_confirmation:'hunter2')
      expect(@first_user).to be_valid
      expect(@second_user).to_not be_valid
    end

    it 'is not valid without a first name' do
      @user = User.new(
        last_name:'Smith',
        email:'test1@gmail.com',
        password:'hunter2',
        password_confirmation:'hunter2')
      expect(@user).to_not be_valid
    end
    
    it 'is not valid without a last name' do
      @user = User.new(
        first_name:'John',
        email:'test1@gmail.com',
        password:'hunter2',
        password_confirmation:'hunter2')
      expect(@user).to_not be_valid
    end
  end

end
