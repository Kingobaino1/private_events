require 'rails_helper'

RSpec.describe 'Sign in a User', type: :feature do
  scenario 'create a new event' do
    visit new_user_registration_path
    fill_in 'Name', with: 'John'
    fill_in 'Email', with: 'John@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'
    click_on 'Create a new Event'
    fill_in 'Enter event title', with: 'test event'
    fill_in 'Event location', with: 'Baghdad'
    fill_in 'event_date', with: Time.new(2022, 0o1, 0o2, 12)
    fill_in 'Describe the event', with: 'Christmas Party'
    click_on 'Create Event'
    expect(page).to have_content('Success! Event was successfully created!')
  end
end
