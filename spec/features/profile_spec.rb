require 'rails_helper'

RSpec.feature 'Edit profile' do
  given(:user) { create(:user, rank: 'lt') }

  background do
    sign_in_user(user)
  end

  scenario 'should update the user profile with the data provided' do
    click_on "#{user.first_name} #{user.last_name}"
    click_on 'Modifier le profil'

    select 'Caporal', from: 'user_rank'
    fill_in 'user_password', with: 'new_password'
    fill_in 'user_password_confirmation', with: 'new_password'
    click_button 'Mettre à jour'

    expect(page).to have_content 'Votre compte a été modifié avec succès'
    expect(page).to have_content 'Caporal'
    expect(page.find('img')['alt']).to have_content 'Caporal'
  end
end
