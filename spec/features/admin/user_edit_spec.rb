require 'rails_helper'

RSpec.feature 'User edit', js: true do
  let(:user) { create(:user) }
  let(:admin) { build(:user, :admin) }

  background do
    sign_in_user(admin)
    visit "/admin/users/#{user.id}"
    save_and_open_page
  end

  scenario 'should update the user profile with given data' do
    click_on "Modifier l'utilisateur"
    fill_in 'Nom', with: 'Kerbal'
    click_on 'Mettre à jour'

    expect(page.current_path).to eq admin_user_path(user)
    expect(page).to have_selector 'p.alert.alert-success'
    expect(page).to have_content 'Kerbal'
  end
end
