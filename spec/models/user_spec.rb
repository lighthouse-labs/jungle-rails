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

  context '.authenticate_with_credentials' do

    it "should login if credentials are correct" do
      user = User.create({
        first_name: 'Zushi',
        last_name: 'San',
        email: 'zushi@san.com',
        password: '123456',
        password_confirmation: '123456'
      })

      expect( user.authenticate_with_credentials(user.email, user.password) ).to eq(user)
    end

    it "should not login if credentials are incorrect" do
      user = User.create({
        first_name: 'Zushi',
        last_name: 'San',
        email: 'zushi@san.com',
        password: '123456',
        password_confirmation: '123456'
      })

      expect( user.authenticate_with_credentials('san@zushi.com', user.password) ).to eq(nil)
      expect( user.authenticate_with_credentials(user.email, '654321') ).to eq(nil)
      expect( user.authenticate_with_credentials('san@zushi.com', '654321') ).to eq(nil)
    end

    it "should login succesfuly if extra space or case is different for the email" do
      user = User.create({
        first_name: 'Zushi',
        last_name: 'San',
        email: 'zushi@san.com',
        password: '123456',
        password_confirmation: '123456'
      })

      user2 = User.create({
        first_name: 'Zushi',
        last_name: 'San',
        email: 'MEOW@san.com',
        password: '123456',
        password_confirmation: '123456'
      })

     expect( user.authenticate_with_credentials(' zushi@san.com ', user.password) ).to eq(user)
     expect( user.authenticate_with_credentials('ZusHi@san.COM', user.password) ).to eq(user)
     expect( user2.authenticate_with_credentials('meow@san.com', user2.password) ).to eq(user2)
    end
  end

end






