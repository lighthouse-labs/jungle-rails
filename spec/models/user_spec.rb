require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "should successfully save" do
      user = User.new
      user.name = "Kelvin Kwon"
      user.email = "kkwon39@gmail.com"
      user.password = "1234"
      user.password_confirmation = "1234"
      expect(user).to be_valid

      user2= User.new
      user.name = "Kelvin Kwon2"
      user.email = "kkwon39@gmail.com"
      user.password = "1234"
      user.password_confirmation = "1234"
      expect(user2).not_to be_valid
    end

    it "should not successfully save" do
      user = User.new
      user.name = "Kelvin Kwon"
      user.email = "kkwon39@gmail.com"
      user.password = "2345"
      user.password_confirmation = nil
      expect(user).not_to be_valid
    end

    it "should not successfully save" do
      user = User.new
      user.name = "Kelvin Kwon"
      user.email = "kkwon39@gmail.com"
      user.password = "25"
      user.password_confirmation = "25"
      expect(user).not_to be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it "should match only if emails and passwords are same" do
      user = User.new
      user.name = "Kelvin Kwon"
      user.email = "kkwon39@gmail.com"
      user.password = "2345"
      user.password_confirmation = "2345"
      user.save

      user2 = User.authenticate_with_credentials("     kkwon39@gmail.com", "2345")
      user2.save
      expect(user.id).to be(user2.id)
    end

    it "should match only if emails and passwords are same" do
      user = User.new
      user.name = "Kelvin Kwon"
      user.email = "kkWON39@gmail.com"
      user.password = "2345"
      user.password_confirmation = "2345"
      user.save

      user2 = User.authenticate_with_credentials("KkWoN39@gmail.com", "2345")
      user2.save
      expect(user.id).to be(user2.id)
    end
  end
end
