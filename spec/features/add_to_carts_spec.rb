require 'rails_helper'

RSpec.feature "Vistor adds to Cart and Quantity Increases", type: :feature, js: true do

  #SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    @category.products.create!(
      name: Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
      )
  end

  scenario "Updates cart" do
    visit root_path
    expect(page).to have_content('My Cart (0)')
    click_on 'Add'
    expect(page).to have_content('My Cart (1)')
    save_screenshot
  end
end

