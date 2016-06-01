require 'rails_helper'

RSpec.feature 'Edit profile' do
  let(:features) { FeaturesSpecHelper.new }

  background do
    @old_password = user.encrypted_password
    features.sign_in(user)

    click_on 'See my profile'

    click_on 'Edit profile'

    select 'Caporal', from: 'user_rank'
    fill_in 'user_password', with: 'new_password'
    fill_in 'user_password_confirmation', with: 'new_password'
    fill_in 'user_current_password', with: user.password
    click_button 'Update'

    @updated_user = User.find_by(email: user.email)
  end

  context 'a user wants to change its profile' do
    let(:user) { create(:user, rank: 'lt') }

    scenario 'should update the user profile with the data provided' do
      expect(page).to have_content 'Your account has been updated successfully.'
      expect(@updated_user.rank).to eq('cal')
      expect(@updated_user.encrypted_password).to_not eq(@old_password)
    end
  end
end
