require 'rails_helper'
require 'capybara/rspec'

describe 'User inventory page', type: :feature do
  before :each do
    user = User.new(name: 'Alex', email: 'email@test.com', password: '123456')
    user.save

    Inventory.create!(name: 'Inventory 1', user_id: user.id)

    sign_in user
  end

  it 'When I access my inventory I can see add new inventory button' do
    visit '/inventory'
    expect(page).to have_content('Inventory')
  end
end