require 'rails_helper'

RSpec.feature 'User edit', js: true do
  let(:user) { create(:user) }
  let(:admin) { create(:user, :admin) }

  background do
    sign_in_user(admin)
    visit edit_admin_user_path(user.id)
  end

  scenario 'should update the user profile with given data' do
    fill_in 'Nom', with: 'Kerbal'
    click_on 'Mettre à jour'

    expect(page.current_path).to eq admin_user_path(user)
    expect(page).to have_selector 'p.alert.alert-success'
    expect(page).to have_content 'Kerbal'
  end
end
