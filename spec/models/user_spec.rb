require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should create user without a problem' do
      user = User.create(
        name: "Joe",
        email: "joe_gato@gmail.com",
        password: "qwerty",
        password_confirmation: "qwerty"
        )
      expect(user).to be_persisted
    end
    it 'is not persisted with nil pass comfirm' do
      user = User.create(
        name: "Joe",
        email: "joe_gato@gmail.com",
        password: "qwerty",
        password_confirmation: nil
        )
      expect(user).to_not be_persisted
    end
    it 'is not persisted with nil pass' do
      user = User.create(
        name: "Joe",
        email: "joe_gato@gmail.com",
        password: nil,
        password_confirmation: "qwerty"
        )
      expect(user).to_not be_persisted
    end
    it 'is not persisted with mismatched passwords' do
      user = User.create(
        name: "Joe",
        email: "joe_gato@gmail.com",
        password: "nah",
        password_confirmation: "qwerty"
        )
      expect(user).to_not be_persisted
    end
    it 'is not persisted with nil name' do
      user = User.create(
        name: nil,
        email: "joe_gato@gmail.com",
        password: "qwerty",
        password_confirmation: "qwerty"
        )
      expect(user).to_not be_persisted
    end
    it 'is not persisted with nil email' do
      user = User.create(
        name: "Joe",
        email: nil,
        password: "qwerty",
        password_confirmation: "qwerty"
        )
      expect(user).to_not be_persisted
    end
    it 'is not persisted with password shorter than 5' do
      user = User.create(
        name: "Joe",
        email: "joe_gato@gmail.com",
        password: "qwer",
        password_confirmation: "qwer"
        )
      expect(user).to_not be_persisted
    end
    it 'is not persisted with same email, different case' do
      user = User.create(
        name: "Joe",
        email: "joe_gato@gmail.com",
        password: "qwerty",
        password_confirmation: "qwerty"
        )
      user2 = User.create(
        name: "Joe",
        email: "JOE_gato@gmail.com",
        password: "qwerty",
        password_confirmation: "qwerty"
        )
      expect(user2).to_not be_persisted
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should login a user who is in the system' do
      user = User.create(
        name: "Joe",
        email: "joe_gato@gmail.com",
        password: "qwerty",
        password_confirmation: "qwerty"
        )
      login = User.authenticate_with_credentials("joe_gato@gmail.com", "qwerty")
      expect(login).to eq(user)
    end
    it 'should not login a user whos is not in the system' do
      user = User.create(
        name: "Joe",
        email: "joe_gato@gmail.com",
        password: "qwerty",
        password_confirmation: "qwerty"
        )
      login = User.authenticate_with_credentials("tr@gmail.com", "qwerty")
      expect(login).to be(nil)
    end
    it 'should log in a user with whitespace around email' do
      user = User.create(
        name: "Joe",
        email: "joe_gato@gmail.com",
        password: "qwerty",
        password_confirmation: "qwerty"
        )
      login = User.authenticate_with_credentials("  joe_gato@gmail.com  ", "qwerty")
      expect(login).to eq(user)
    end
    it 'should log in a user with email in different case' do
      user = User.create(
        name: "Joe",
        email: "Joe_gato@gmail.com",
        password: "qwerty",
        password_confirmation: "qwerty"
        )
      login = User.authenticate_with_credentials("JOE_gato@gmail.com", "qwerty")
      expect(login).to eq(user)
    end
  end
end
