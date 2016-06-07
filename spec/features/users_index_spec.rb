require 'rails_helper'

RSpec.feature 'Users index' do
  background do
    sign_in_user(user)
    visit '/admin/users'
  end

  context 'a non-admin user wants to access the index' do
    let(:user) { build(:user) }

    scenario 'should forbid the access to the users list' do
      expect(page).to have_content "You're not allowed to access
                                    this area: get out!"
      expect(page.current_path).to eq root_path
    end
  end

  context 'an admin user wants to access the index' do
    let(:user) { build(:user, :admin) }

    scenario 'should allow access to the users list' do
      expect(page).to have_content 'Users List'
      expect(page.current_path).to eq admin_users_path
    end
  end
end
