require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'a devise user is extended with first and last name' do
      user = User.create(first_name: 'Taylor', last_name: 'Hulsmans')
      expect(user).to be_valid
    end
  end
end
