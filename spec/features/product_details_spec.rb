require 'rails_helper'

RSpec.feature "Visitor navigates to product details page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    1.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see a single product" do
    # ACT
    visit root_path

    first('article.product').find_link('Details').click
   
    # DEBUG
    sleep 1
    save_screenshot

    # # VERIFY
    # expect(page).to have_css 'article.product', count: 10
  end
end




# scenario "They complete an order while logged in" do
#   visit '/login'

#   within 'form' do
#     fill_in id: 'email', with: 'first@user.com'
#     fill_in id: 'password', with: '123456'

#     click_button 'Submit'
#   end

#   expect(page).to have_content 'Thank you for your order first@user.com!'
# end