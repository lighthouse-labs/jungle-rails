require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  before :each do
      @category = Category.create! name: 'Apparel'

      10.times do |n|
        @category.products.create!(
          name:  Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel1.jpg'),
          quantity: 10,
          price: 64.99
        )
      end
    end

scenario "They can click on a product and see the details" do
  # ACT
    visit "/"

    page.find("a#product_1").trigger('click')
    expect(page).to have_content('Quantity')
    expect(page).to have_css '.products-show'
    puts page.html


    # DEBUG / VERIFY
    save_screenshot
    end
end
