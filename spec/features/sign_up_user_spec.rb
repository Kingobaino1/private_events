require 'rails_helper'

RSpec.describe 'Sign up a User', type: :feature do
  scenario 'invalid inputs' do
    visit new_user_registration_path
    fill_in 'Name', with: ''
    fill_in 'Email', with: 'John@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'
    expect(page).to have_content('1 error prohibited this user from being saved:')
  end

  scenario 'valid inputs' do
    expect(page).to have_content('Success! Welcome! You have signed up successfully.')
  end
end
