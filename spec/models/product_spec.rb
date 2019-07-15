require 'rails_helper'

RSpec.describe Product, type: :model do
  subject { described_class.new }

    describe 'Validations' do
      it "is valid with valid attriubtes" do
        subject.name = "Star Wars Tee"
        subject.price = '26.00'.to_i
        subject.quantity = 10
        subject.category = Category.new(name: "Apparel")
      end

      it "is not valid without a name" do
        expect(subject).to_not be_valid
      end

      it "is not valid without a price" do
        subject.name = "Silk Shirt"
        expect(subject).to_not be_valid
      end

      it "is not valid without a quantity" do
        subject.name = "Listerine"
        subject.price = '35.00'.to_i
        expect(subject).to_not be_valid
      end

      it "is not valid without a category" do
        subject.name = "Apple Watch"
        subject.price = '00.05'.to_i
        subject.quantity = 1
        expect(subject).to_not be_valid
      end

    end
end
