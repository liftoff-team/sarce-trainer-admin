require 'rails_helper'

RSpec.feature 'Sign in' do
  background { sign_in_user(user) }

  context 'an user wants to sign in' do
    let(:user) { build(:user) }

    scenario 'should sign in the user with valid credentials' do
      expect(page).to have_content 'Connecté(e) avec succès.'
    end
  end
end
