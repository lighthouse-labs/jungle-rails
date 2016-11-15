require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: :true do

  before :each do
    User.create!({
      first_name: 'Raymond',
      last_name: 'Garraty',
      email: 'possiblystillwalking@thelongwalk.com',
      password: 'unnecessaryliteraryreference',
      password_confirmation: 'unnecessaryliteraryreference'
      })
  end

  scenario "Users are redirected to homepage on successful login" do
    visit '/login'
    fill_in 'email', with: 'possiblystillwalking@thelongwalk.com'
    fill_in 'password', with: 'unnecessaryliteraryreference'
    click_on 'Submit'
    expect(page).to have_content 'Raymond'
  end
end
