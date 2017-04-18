require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should successfully create a user' do
      @user = User.create(
        first_name: 'first name',
        last_name: 'last name',
        email: 'test@test.com',
        password: 'asdf',
        password_confirmation: 'asdf'
      )
      puts @user.errors.full_messages
      expect(@user).to be_persisted
    end

    it 'should not create a user with no first name' do
      @user = User.create(
        first_name: nil,
        last_name: 'last name',
        email: 'test@test.com',
        password: 'asdf',
        password_confirmation: 'asdf'
      )
      puts @user.errors.full_messages
      expect(@user).to_not be_valid
    end

    it 'should not create a user with no last name' do
      @user = User.create(
        first_name: 'first name',
        last_name: nil,
        email: 'test@test.com',
        password: 'asdf',
        password_confirmation: 'asdf'
      )
      puts @user.errors.full_messages
      expect(@user).to_not be_valid
    end

    it 'should not allow user to be created when password != password confirmation' do
      @user = User.create(
        first_name: 'first name',
        last_name: 'last name',
        email: 'test@test.com',
        password: 'asdf',
        password_confirmation: '9s'
      )
      puts @user.errors.full_messages
      expect(@user).to_not be_valid
    end

    it 'should not allow user to be created if password not given' do
      @user = User.create(
        first_name: 'first name',
        last_name: 'last name',
        email: 'test@test.com',
        password: nil,
        password_confirmation: 'asdf'
      )
      puts @user.errors.full_messages
      expect(@user).to_not be_valid
    end

    it 'should not allow user to be created if password confirmation not given' do
      @user = User.create(
        first_name: 'first name',
        last_name: 'last name',
        email: 'test@test.com',
        password: 'asdf',
        password_confirmation: nil
      )
      puts @user.errors.full_messages
      expect(@user).to_not be_valid
    end

    it 'should not allow user to be created if no email given' do
      @user = User.create(
        first_name: 'first name',
        last_name: 'last name',
        email: nil,
        password: 'asdf',
        password_confirmation: 'asdf'
      )
      puts @user.errors.full_messages
      expect(@user).to_not be_valid
    end

    it 'should not allow user to be created without unique email' do
      @user1 = User.create(
        first_name: 'first name',
        last_name: 'last name',
        email: 'test@test.com',
        password: 'asdf',
        password_confirmation: 'asdf'
      )

      @user = User.create(
        first_name: 'other first name',
        last_name: 'other last name',
        email: 'test@test.com',
        password: 'blah',
        password_confirmation: 'blah'
      )
      puts @user.errors.full_messages
      expect(@user).to_not be_valid
    end

    it 'should not allow user to be created without unique email (case insensitive)' do
      @user1 = User.create(
        first_name: 'first name',
        last_name: 'last name',
        email: 'test@test.COM',
        password: 'asdf',
        password_confirmation: 'asdf'
      )

      @user = User.create(
        first_name: 'other first name',
        last_name: 'other last name',
        email: 'TEST@TEST.com',
        password: 'blah',
        password_confirmation: 'blah'
      )
      puts @user.errors.full_messages
      expect(@user).to_not be_valid
    end

    it 'should not allow user to create password < 4 long' do
      @user = User.create(
        first_name: 'first name',
        last_name: 'last name',
        email: 'test@test.com',
        password: 'asd',
        password_confirmation: 'asd'
      )
      puts @user.errors.full_messages
      expect(@user).to_not be_valid
    end

    it 'should not allow user to create password > 15 long' do
      @user = User.create(
        first_name: 'first name',
        last_name: 'last name',
        email: 'test@test.com',
        password: 'a;lksdjf;lkasjdf;klajs;ldkfj;a',
        password_confirmation: 'a;lksdjf;lkasjdf;klajs;ldkfj;a'
      )
      puts @user.errors.full_messages
      expect(@user).to_not be_valid
    end

    xit 'should allow a user to log in' do
      @user = User.create(
        first_name: 'first name',
        last_name: 'last name',
        email: 'test@test.com',
        password: 'asdf',
        password_confirmation: 'asdf'
      )

      # TODO: need to look at session data?

      puts @user.errors.full_messages
      expect(@user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it 'user authentication should work with proper credentials' do
      @user = User.create(
        first_name: 'first name',
        last_name: 'last name',
        email: 'test@test.com',
        password: 'asdf',
        password_confirmation: 'asdf'
      )

      authenticate = User.authenticate_with_credentials('test@test.com', @user.password)
      puts @user.errors.full_messages
      expect(authenticate).to_not be_nil
    end

    it 'user authentication should not work with improper credentials' do
      @user = User.create(
        first_name: 'first name',
        last_name: 'last name',
        email: 'test@test.com',
        password: 'asdf',
        password_confirmation: 'asdf'
      )

      authenticate = User.authenticate_with_credentials(@user.email, 'bad password')
      puts @user.errors.full_messages
      expect(authenticate).to be_nil
    end

    it 'user authentication should work with trailing whitespace' do
      @user = User.create(
        first_name: 'first name',
        last_name: 'last name',
        email: " example@domain.com ",
        password: 'asdf',
        password_confirmation: 'asdf'
      )

      authenticate = User.authenticate_with_credentials("example@domain.com", @user.password)
      puts @user.errors.full_messages
      expect(authenticate).to be_nil
    end

    it 'user authentication should work with wrong case' do
      @user = User.create(
        first_name: 'first name',
        last_name: 'last name',
        email: "eXample@domain.COM",
        password: 'asdf',
        password_confirmation: 'asdf'
      )

      authenticate = User.authenticate_with_credentials("EXAMPLe@DOMAIN.CoM", @user.password)
      puts @user.errors.full_messages
      expect(authenticate).to be_nil
    end
  end
end
