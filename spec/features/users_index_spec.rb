require 'rails_helper'

RSpec.feature 'Users index' do
  let(:features) { FeaturesSpecHelper.new }

  background do
    features.sign_in(user)
    visit '/users'
  end

  context 'a non-admin user wants to access the index' do
    let(:user) { build(:non_admin) }

    scenario 'should forbid the access to the users list' do
      expect(page).to have_content "You're not allowed to access
                                    this area: get out!"
      expect(page.current_path).to eq root_path
    end
  end

  context 'an admin user wants to access the index' do
    let(:user) { build(:admin) }

    scenario 'should allow access to the users list' do
      expect(page).to have_content 'Users List'
      expect(page.current_path).to eq users_path
    end
  end
end
