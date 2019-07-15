require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it 'should let a user be created if password and password_confirmation match'
    
    it 'should not let a user be created if a user exists in system, not case sensitive'

  end
  
end
