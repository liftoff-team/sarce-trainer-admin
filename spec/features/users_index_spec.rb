require 'rails_helper'

feature 'Users index' do
  let(:user) { build(:user) }
  let(:admin) { build(:admin) }

  scenario 'As a non-admin user, I cannot access the index' do
    user.confirm

    visit '/users/sign_in'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'

    visit '/users'
    expect(page).to have_content "You're not allowed to access
                                  this area: get out!"
    expect(page.current_path).to eq root_path
  end

  scenario 'As an admin user, I can access the index' do
    admin.confirm

    visit '/users/sign_in'
    fill_in 'user_email', with: admin.email
    fill_in 'user_password', with: admin.password
    click_button 'Log in'

    visit '/users'
    expect(page).to have_content 'Users List'
    expect(page.current_path).to eq users_path
  end
end
