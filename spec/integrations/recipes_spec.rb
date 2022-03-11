# RSpec.describe 'Post index view', type: :feature do
#   before :each do
#     User.create(name: 'Alex', email: 'alex@gmail.com', password: 'abc123')
#     visit new_user_session_path
#     within('form') do
#       fill_in 'user_email', with: 'alex#gmail.com'
#       fill_in 'user_password', with: 'abc123'
#     end
#     click_button 'Log in'
#     click_button ('MyRecipes')
#   end

#   it "Check Recipes index page" do
#     expect(page).to have_content("Recipies:")
#   end

# end
