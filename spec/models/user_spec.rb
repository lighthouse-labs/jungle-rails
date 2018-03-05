require 'rails_helper'

RSpec.describe User, type: :model do
  context "Validations:" do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:password_confirmation) }

    it "should fail if password and password confirmation are different" do
      user = User.create({
        first_name: 'Zushi',
        last_name: 'San',
        email: 'zushi@san.com',
        password: '123456',
        password_confirmation: '134567'
      })

     expect(user).to_not be_valid
    end

    it "should fail if email already exist regardless of case" do
      user1 = User.create({
        first_name: 'Zushi',
        last_name: 'San',
        email: 'zushi@san.com',
        password: '123456',
        password_confirmation: '123456'
      })

      user2 = User.create({
        first_name: 'Zushi',
        last_name: 'San',
        email: 'zushi@san.com',
        password: '123456',
        password_confirmation: '123456'
      })

      user3 = User.create({
        first_name: 'Zushi',
        last_name: 'San',
        email: 'ZUSHI@SAN.COM',
        password: '123456',
        password_confirmation: '123456'
      })

     expect(user2).to_not be_valid
     expect(user3).to_not be_valid
    end

    it "should fail if password is to short or too long" do
      user1 = User.create({
        first_name: 'Zushi',
        last_name: 'San',
        email: 'zushi@san.com',
        password: '12',
        password_confirmation: '12'
      })

      user2 = User.create({
        first_name: 'Zushi',
        last_name: 'San',
        email: 'zushi@sano2.com',
        password: '12345678901234567890123456789012345678901',
        password_confirmation: '12345678901234567890123456789012345678901'
      })

      expect(user1).to_not be_valid
      expect(user2).to_not be_valid
    end
  end

end






