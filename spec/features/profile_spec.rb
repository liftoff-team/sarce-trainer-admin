require 'rails_helper'

RSpec.feature 'Edit profile' do
  background do
    sign_in_user(user)

    click_on 'My profile'

    click_on 'Edit profile'

    select 'Caporal', from: 'user_rank'
    fill_in 'user_password', with: 'new_password'
    fill_in 'user_password_confirmation', with: 'new_password'
    fill_in 'user_current_password', with: user.password
    click_button 'Update'
  end

  context 'a user wants to change its profile' do
    let(:user) { create(:user, rank: 'lt') }

    scenario 'should update the user profile with the data provided' do
      expect(page).to have_content 'Your account has been updated successfully.'
      expect(page).to have_content 'Caporal'
      expect(page.find('img')['alt']).to have_content 'Caporal'
    end
  end
end
