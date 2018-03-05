require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'a devise user is extended with first and last name' do
      user = User.create(first_name: 'Taylor', last_name: 'Hulsmans', email:'thulsmans.2994@me.com', password:'topsecret')
      expect(user).to be_valid
    end

    it 'a devise user without a first_name is rejected' do
      user = User.create(first_name: nil, last_name: 'Hulsmans', email:'thulsmans.2994@me.com', password:'topsecret')
      expect(user).to_not be_valid
    end

    it 'a devise user without a last_name is rejected' do
      user = User.create(first_name: 'Taylor', last_name: nil, email:'thulsmans.2994@me.com', password:'topsecret')
      expect(user).to_not be_valid
    end
  end
end
