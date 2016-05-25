require 'rails_helper'

feature 'Users index' do
  let(:user) { build(:user) }
  let(:features) { FeaturesSpecHelper.new }
  let(:admin) { build(:admin) }

  scenario 'As a non-admin user, I cannot access the index' do
    features.sign_in(user)

    visit '/users'
    expect(page).to have_content "You're not allowed to access
                                  this area: get out!"
    expect(page.current_path).to eq root_path
  end

  scenario 'As an admin user, I can access the index' do
    features.sign_in(admin)

    visit '/users'
    expect(page).to have_content 'Users List'
    expect(page.current_path).to eq users_path
  end
end
