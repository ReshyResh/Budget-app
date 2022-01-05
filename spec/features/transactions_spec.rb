require 'rails_helper'

RSpec.feature 'Show transactions', type: :feature do
  background do
    login_user
    visit category_transactions_path(@category.id)
  end

  scenario 'Should display transaction name' do
    expect(page).to have_content(@transaction.name)
  end

  scenario 'Should display transaction number' do
    expect(page).to have_content(@transaction.transaction_number)
  end

  scenario 'Should display transaction total' do
    expect(page).to have_content(@transaction.total)
  end

  scenario 'Should display transaction date' do
    expect(page).to have_content(@transaction.created_at.to_date)
  end
end
