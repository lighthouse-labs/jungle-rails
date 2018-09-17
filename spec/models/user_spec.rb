require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do
    it 'is valid with valid attributes' do
      user = User.new(
        first_name:'John',
        last_name:'Smith',
        email:'johnsmith@gmail.com',
        password:'hunter2',
        password_confirmation:'hunter2')
        expect(user).to be_valid
    end
    
    it 'is not valid without a password' do
      user = User.new(
        first_name:'John',
        last_name:'Smith',
        email:'johnsmith@gmail.com',
        password_confirmation:'hunter2')
      expect(user).to_not be_valid
    end

    it 'is not valid without a password confirmation' do
      user = User.new(
        first_name:'John',
        last_name:'Smith',
        email:'johnsmith@gmail.com',
        password:'hunter2')
      expect(user).to_not be_valid
    end

    it 'is not valid without matching password and password confirmation' do
      user = User.new(
        first_name:'John',
        last_name:'Smith',
        email:'johnsmith@gmail.com',
        password:'hunter2',
        password_confirmation:'differentpassword123')
      expect(user).to_not be_valid
    end

    it 'is not valid without an email' do
      user = User.new(
        first_name:'John',
        last_name:'Smith',
        password:'hunter2',
        password_confirmation:'hunter2')
      expect(user).to_not be_valid
    end

    it 'is not valid without a unique email' do
      @first_user = User.create(
        first_name:'Joe',
        last_name:'Bloggs',
        email:'testingemail@gmail.com',
        password:'testpassword',
        password_confirmation:'testpassword')
        
      @second_user = User.new(
        first_name:'John',
        last_name:'Smith',
        email:'testingemail@gmail.com',
        password:'hunter2',
        password_confirmation:'hunter2')

      @third_user = User.new(
        first_name:'John',
        last_name:'Smith',
        email:'TESTINGemail@gmail.com',
        password:'hunter2',
        password_confirmation:'hunter2')
      expect(@first_user).to be_valid
      expect(@second_user).to_not be_valid
      expect(@third_user).to_not be_valid
    end

    it 'is not valid without a first name' do
      user = User.new(
        last_name:'Smith',
        email:'test1@gmail.com',
        password:'hunter2',
        password_confirmation:'hunter2')
      expect(user).to_not be_valid
    end
    
    it 'is not valid without a last name' do
      user = User.new(
        first_name:'John',
        email:'test1@gmail.com',
        password:'hunter2',
        password_confirmation:'hunter2')
      expect(user).to_not be_valid
    end

    it 'is not valid with a password shorter than 8' do
      user = User.new(
        first_name:'John',
        email:'test1@gmail.com',
        password:'',
        password_confirmation:'test')
        expect(user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    before(:each) do
      @user = User.create(
        first_name:'John',
        last_name:'Smith',
        email:'johnsmith@gmail.com',
        password:'hunter2',
        password_confirmation:'hunter2')
    end

    it 'should return user with valid credentials input' do
      user_auth = User.authenticate_with_credentials('johnsmith@gmail.com', 'hunter2')
      user_auth.should be_truthy
      user_auth.should eq(@user)
    end

    it 'should return nil with invalid password' do
      user_auth = User.authenticate_with_credentials('johnsmith@gmail.com', 'hunter1')
      user_auth.should_not be_truthy
      user_auth.should_not eq(@user)
    end

    it 'should return nil with invalid email' do
      user_auth = User.authenticate_with_credentials('johnsmith@gm.com', 'hunter2')
      user_auth.should_not be_truthy
      user_auth.should_not eq(@user)
    end

    it 'should return nil with invalid email & password' do
      user_auth = User.authenticate_with_credentials('johnsmith@gl.com', 'hunter1')
      user_auth.should_not be_truthy
      user_auth.should_not eq(@user)
    end

    it 'should authenticate successfully if user inputs spaces alongside correct email address' do
      user_auth = User.authenticate_with_credentials('  johnsmith@gmail.com  ', 'hunter2')
      user_auth.should be_truthy
      user_auth.should eq(@user)
    end

    it 'should authenticate successfully if user inputs the wrong case for their email' do
      user_auth = User.authenticate_with_credentials('JoHnSMITH@gmail.com', 'hunter2')
      user_auth.should be_truthy
      user_auth.should eq(@user)
    end

  end

  
end
