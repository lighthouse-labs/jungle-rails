require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    cat4 = Category.find_or_create_by! name: 'Toys'
    subject = cat4.products.create({ name: 'Tamagotchi', price: 999.99, quantity: 40 })
    
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
  
    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a price" do
      subject.price = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a quantity" do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a category" do
      subject.category = nil
      expect(subject).to_not be_valid
    end
    
  end
end
