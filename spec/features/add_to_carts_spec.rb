require 'rails_helper'

RSpec.feature "Visitor pushes add to cart on product and it adds the tiem to the cart", type: :feature, js: true do

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


  scenario "They see all products" do
    visit "/"
    page.find("#addToCart_1").trigger('click')
    expect(page).to have_content('My Cart (1)')
    puts page.html


    # DEBUG / VERIFY
    save_screenshot
    end
end
