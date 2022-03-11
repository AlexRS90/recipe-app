# require 'rails_helper'

# RSpec.describe 'Post index view', type: :feature do
#   before :each do
#     User.create(name: 'Alex', email: 'alex@gmail.com', password: 'abc123')

#     visit new_user_session_path
#     within('form') do
#       fill_in 'user_email', with: 'alex#gmail.com'
#       fill_in 'user_password', with: 'abc123'
#     end
#     click_button 'Log in'
#   end

#   context 'Elements on page inventory' do
#     it 'Form displayed to create a new one' do

#       expect(page).to have_content("Welcome to our Recipes App")
#     #   expect(page).to have_css('#data_name')
#     end

#     # it 'Should display User\'s name' do
#     #   expect(page).to have_content(@users.first.name)
#     # end

#   end

# #   context 'User interaction of profile' do
# #     it 'Click on a post and redirect me to its full page' do
# #       click_link('Comments', match: :first)
# #       expect(page).to have_content 'Write a new comment'
# #     end
# #   end
# end
