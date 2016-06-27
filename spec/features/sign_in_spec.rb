require 'rails_helper'

RSpec.feature 'Sign in' do
  given(:user) { create(:user) }

  background { sign_in_user(user) }

  scenario 'should sign in the user with valid credentials' do
    expect(page).to have_content 'Connecté(e) avec succès.'
  end
end
