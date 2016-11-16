require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

        ##TRUE CHECKS

    it "is true with valid attributes" do
      @user = User.new({
        firstname: "testfirst",
        lastname: "testlast",
        email: "test@test.com",
        password: "test",
        password_confirmation: "test"
      })
      expect(@user.save).to be true
    end

    #FALSE CHECKS

    it "is false with no firstname" do
      @user = User.new({
        firstname: nil,
        lastname: "testlast",
        email: "test@test.com",
        password: "test",
        password_confirmation: "test"
      })
      expect(@user.save).to be false
    end

    it "is false with no lastname" do
      @user = User.new({
        firstname: "testfirst",
        lastname: nil,
        email: "test@test.com",
        password: "test",
        password_confirmation: "test"
      })
      expect(@user.save).to be false
    end

    it "is false with no password" do
      @user = User.new({
        firstname: "testfirst",
        lastname: "testlast",
        email: "test@test.com",
        password: nil,
        password_confirmation: "test"
      })
      expect(@user.save).to be false
    end

    it "is false with no password_confirmation" do
      @user = User.new({
        firstname: "testfirst",
        lastname: "testlast",
        email: "test@test.com",
        password: "test",
        password_confirmation: nil
      })
      expect(@user.save).to be false
    end

    it "is false if password does not match password_confirmation" do
      @user = User.new({
        firstname: "testfirst",
        lastname: "testlast",
        email: "test@test.com",
        password: "test",
        password_confirmation: "nope"
      })
      expect(@user.save).to be false
    end

    it "is false if the password is less than 4 chars" do
      @user = User.new({
        firstname: "testfirst",
        lastname: "testlast",
        email: "test@test.com",
        password: "te",
        password_confirmation: "te"
      })
      expect(@user.save).to be false
    end

    it "is false with no email" do
      @user = User.new({
        firstname: "testfirst",
        lastname: "testlast",
        email: nil,
        password: "test",
        password_confirmation: "nope"
      })
      expect(@user.save).to be false
    end

    it "is false if email is a duplicate" do
      @user1 = User.new({
        firstname: "testfirst",
        lastname: "testlast",
        email: "test@test.com",
        password: "test",
        password_confirmation: "test"
      })
      @user1.save
      @user2 = User.new({
        firstname: "testfirst",
        lastname: "testlast",
        email: "test@test.com",
        password: "test",
        password_confirmation: "test"
      })
      expect(@user2.save).to be false
    end

    it "is false if emails are a diff case" do
      @user1 = User.new({
        firstname: "testfirst",
        lastname: "testlast",
        email: "test@test.com",
        password: "test",
        password_confirmation: "test"
      })
      @user2 = User.new({
        firstname: "testfirst",
        lastname: "testlast",
        email: "TEST@teSt.COM",
        password: "test",
        password_confirmation: "test"
      })
      @user1.save
      expect(@user2.save).to be false
    end
  end

  describe '.authenticate_with_credentials' do

    it "should return user if params are valid" do
      user = User.new({
        firstname: "testfirst",
        lastname: "testlast",
        email: "test@test.com",
        password: "test",
        password_confirmation: "test"
      })
      user.save
      @user = User.authenticate_with_credentials(" test@test.com ", "test")
      expect(@user).to eql user
    end

    it "returns nil if given wrong email" do
      user = User.new({
        firstname: "testfirst",
        lastname: "testlast",
        email: "test@test.com",
        password: "test",
        password_confirmation: "test"
      })
      user.save
      @user = User.authenticate_with_credentials("fail@fail.com", "test")
      expect(@user).to be nil
    end

    it "returns nil if given wrong password" do
      user = User.new({
        firstname: "testfirst",
        lastname: "testlast",
        email: "test@test.com",
        password: "test",
        password_confirmation: "test"
      })
      user.save
      @user = User.authenticate_with_credentials("test@test.com", "BURP")
      expect(@user).to be nil
    end

    it "should return user if email has extra spaces" do
      user = User.new({
        firstname: "testfirst",
        lastname: "testlast",
        email: "test@test.com",
        password: "test",
        password_confirmation: "test"
      })
      user.save
      @user = User.authenticate_with_credentials(" test@test.com ", "test")
      expect(@user).to eql user
    end

    it "returns user ignoring email case sensitivity" do
      user = User.new({
        firstname: "testfirst",
        lastname: "testlast",
        email: "test@test.com",
        password: "test",
        password_confirmation: "test"
      })
      user.save
      @user = User.authenticate_with_credentials("tEst@TeSt.coM", "test")
      expect(@user).to eql user
    end

  end
end
