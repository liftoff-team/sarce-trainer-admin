require 'rails_helper'

feature 'Edit profile' do
  let(:user) { create(:user) }
  let(:features) { FeaturesSpecHelper.new }

  scenario 'A user edits its profile information and password' do
    features.sign_in(user)

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
