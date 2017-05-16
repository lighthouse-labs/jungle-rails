require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new({first_name: "John",
      last_name: "Doe",
       email: "john@doe.com", password: "iamjohn", password_confirmation: "iamjohn"})
  end


  describe 'user_validation' do
    it "should be valid" do
        @user.valid?
        expect(@user.valid?).to be true
    end

    it "should have a first_name" do
      @user.first_name = nil
      expect(@user.valid?).to be false
    end

    it "should have a last_name" do
      @user.last_name = nil
      expect(@user.valid?).to be false
    end

    it "should have a email" do
      @user.email = nil
      expect(@user.valid?).to be false
    end

    it "should have a password" do
      @user.password = nil
      expect(@user.valid?).to be false
    end

    it "should have a password_confirmation" do
      @user.password_confirmation = nil
      expect(@user.valid?).to be false
    end
  end

  describe 'password_validation' do
    it "should not allow invalid password confirmation" do
      @user.password_confirmation = "john"
      expect(@user.valid?).to be false
    end
  end

  describe 'emila_uniqueness' do
    it "should not allow duplicated emails" do
      @user.save!
      @user2 = User.new({
        email: @user.email,
        first_name: "Test",
        last_name: "Test",
        password: "123123",
        password_confirmation: "123123"
        })
      expect(@user2.valid?).not_to be true
    end
  end

  describe 'password_min_length' do
    it "should have a min length" do
      @user.password = "123"
      expect(@user.valid?).to be false
    end
  end

  describe '.authenticate_with_credentials' do
    it "should check if a user matches password and email" do
      @user.save!
      @authenticated_user = User.authenticate_with_credentials("John@doe.com","iamjohn")
      expect(@authenticated_user).to be true
    end
  end

  describe '.authenticate_with_credentials' do
    it "should work if there are spaces around email" do
      @user.save!
      @authenticated_user = User.authenticate_with_credentials("   John@doe.com  ","iamjohn")
      expect(@authenticated_user).to be true
    end
  end

end

