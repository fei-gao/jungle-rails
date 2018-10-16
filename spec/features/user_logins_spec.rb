require 'rails_helper'

RSpec.feature "UserLogIn", type: :feature, js: true do
# SETUP
before :each do
  User.create!(name: 'Alice', email: 'alice@gmail.com', password: '123456', password_confirmation: '123456')
  end

scenario "Users can log in" do
  # ACT
  visit '/login'

  within 'form' do
    fill_in id: 'email', with: 'alice@gmail.com'
    fill_in id: 'password', with: '123456'

    click_button 'Submit'
  end
  save_screenshot
  expect(page).to have_content 'Hello Alice'
end

end