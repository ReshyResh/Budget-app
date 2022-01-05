require 'rails_helper'

RSpec.feature 'User logs in and views homepage', type: :feature do
  background do
    login_user
    visit root_path
  end

  scenario 'Can see welcome message' do
    expect(page).to have_content 'General spendings'
  end

  scenario 'Can see transactions number' do
    expect(page).to have_content 'Total transactions:'
  end

  scenario 'Can see logout button' do
    expect(page).to have_content 'Logout'
  end
end
