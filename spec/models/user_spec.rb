require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "should create a user" do
      user = User.new password_digest: "hunter212", email: "jimmy@jimmy.com", first_name: "jimmy", last_name: "timmy"
      user.save
      expect(user).to be_an_instance_of(User)
    end

    it "should need both a password and password_confirmation" do
      user = User.new password: "monkey121", email: "jimmy@jimmy.com", first_name: "jimmy", last_name: "timmy"
      user.save
      expect(user.valid?).to be_falsey
    end

    it "should be created with a matching password and password_confirmation" do
      user = User.new password: "monkey121", password_confirmation: "bloopbloop", email: "jimmy@jimmy.com", first_name: "jimmy", last_name: "timmy"
      user.save
      expect(user.valid?).to be_falsey
    end

    it "should have a unique email address" do
      user = User.new email: "raymond@gmail.com", password: "test123", password_confirmation: "test123", first_name: "jimmy", last_name: "timmy"
      user.save
      user2 = User.new email: "Raymond@gmail.com", password: "test123", password_confirmation: "test123", first_name: "jimmy", last_name: "timmy"
      user2.save
      expect(user2.valid?).to be_falsey
    end

    it "should require first name, last name, email" do
      user = User.new email: "raymond@gmail.com", password: "test123", password_confirmation: "test123"
      user.save
      expect(user.valid?).to be_falsey
    end

    it "should have a password minimum length of 6" do
      user = User.new email: "raymond@gmail.com", password: "test", password_confirmation: "test", first_name: "jimmy", last_name: "timmy"
      user.save
      expect(user.valid?).to be_falsey
    end
  end

  describe '.authenticate_with_credentials' do
    before :each do
      @user = User.new email: "raymOnd@gmail.com", password: "test123", password_confirmation: "test123", first_name: "jimmy", last_name: "timmy"
      @user.save
    end

    it "should return nil if the wrong email is provided" do
      user = User.authenticate_with_credentials("raymond2@gmail.com", "test123")
      expect(user).to be(nil)
    end

    it "should return nil if the wrong password is provided" do
      user = User.authenticate_with_credentials("raymond@gmail.com", "test12")
      expect(user).to be(nil)
    end

    it "should return user if correct email & pass provided, regardless of case of empty space" do
      user = User.authenticate_with_credentials("  RayMond@gmail.com", "test123")
      expect(user).to be_an_instance_of(User)
    end
  end
end
