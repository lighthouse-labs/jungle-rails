require 'rails_helper'

RSpec.describe Product, type: :model do
    context "Validations:" do

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:quantity) }
    it { is_expected.to validate_presence_of(:category) }

    category = Category.create! name: 'Books'
    product = category.products.create!({
      name: 'Oathbringer',
      description: "Best book",
      quantity: 3,
      price: 35.99
    })

    it { expect(product.name).not_to eql nil }

  end
end
