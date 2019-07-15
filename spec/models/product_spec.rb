require 'rails_helper'

RSpec.describe Product, type: :model do
  subject { 
    described_class.new(name: "Star Wars Tee", price_cents: 2600, 
                        quantity: 10, category: Category.new(name: "Apparel")) 
  }
  
  it "is valid with valid attriubtes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a price" do
    subject.price_cents = nil
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
