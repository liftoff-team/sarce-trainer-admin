require 'rails_helper'

RSpec.feature 'Edit profile' do
  background do
    sign_in_user(user)

    click_on 'Voir mon profil'

    click_on 'Modifier le profil'

    select 'Caporal', from: 'user_rank'
    fill_in 'user_password', with: 'new_password'
    fill_in 'user_password_confirmation', with: 'new_password'
    fill_in 'user_current_password', with: user.password
    click_button 'Mettre à jour'
  end

  context 'a user wants to change its profile' do
    let(:user) { create(:user, rank: 'lt') }

    scenario 'should update the user profile with the data provided' do
      expect(page).to have_content 'Votre compte a été modifié avec succès'
      expect(page).to have_content 'Caporal'
      expect(page.find('img')['alt']).to have_content 'Caporal'
    end
  end
end
