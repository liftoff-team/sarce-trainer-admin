require 'rails_helper'

feature 'edit profile' do
  subject(:user) { create(:user) }

  scenario 'an user can edit its profile information and password' do
    user.confirm

    visit '/users/sign_in'

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'

    click_on 'See my profile'

    click_on 'Edit profile'

    select 'Sergent', from: 'user_rank'
    fill_in 'user_password', with: 'new_password'
    fill_in 'user_password_confirmation', with: 'new_password'
    fill_in 'user_current_password', with: user.password
    click_button 'Update'

    expect(page).to have_content 'Your account has been updated successfully.'
    expect(User.find_by(email: user.email).rank).to eq('sgt')
  end
end
