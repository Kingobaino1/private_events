require 'rails_helper'

RSpec.describe 'Sign in a User', type: :feature do
  scenario 'Signs in user' do
    visit new_user_registration_path
    fill_in 'Name', with: 'John'
    fill_in 'Email', with: 'John@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'
    click_on 'Sign Out'
    visit new_user_session_path
    fill_in 'Email', with: 'John@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'
    expect(page).to have_content('Success! Signed in successfully.')
  end

  scenario 'Invalid user inputs' do
    visit new_user_registration_path
    fill_in 'Name', with: 'John'
    fill_in 'Email', with: 'John@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'
    click_on 'Sign Out'
    visit new_user_session_path
    fill_in 'Email', with: 'John@example.com'
    fill_in 'Password', with: 'passwords'
    click_on 'Log in'
    expect(page).to have_content('Invalid Email or password.')
  end
end
