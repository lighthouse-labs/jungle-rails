require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    it "is not valid without a name"
    it "is not valid without a price"
    it "is not valid without a quanity"
    it "is not valid without a category"
    

  end
end



# validates :name, presence: true
# validates :price, presence: true
# validates :quantity, presence: true
# validates :category, presence: true