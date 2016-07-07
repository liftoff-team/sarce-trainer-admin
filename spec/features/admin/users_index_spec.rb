require 'rails_helper'

RSpec.feature 'Users index' do
  background do
    sign_in_user(user)
    visit admin_users_path
  end

  context 'a non-admin user wants to access the index' do
    given(:user) { create(:user) }

    scenario 'should forbid the access to the users list' do
      expect(page).to have_content "Vous n'êtes pas administrateur,
                                    accès interdit !"
      expect(page.current_path).to eq(my_profile_path)
    end
  end

  context 'an admin user wants to access the index' do
    given(:user) { create(:user, :admin) }

    scenario 'should allow access to the users list' do
      expect(page).to have_content 'Liste des utilisateurs'
      expect(page.current_path).to eq(admin_users_path)
    end
  end
end
