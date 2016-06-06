require 'rails_helper'

RSpec.feature 'Sign in' do
  background { sign_in_user(user) }

  context 'an user wants to sign in' do
    let(:user) { build(:user) }

    scenario 'should sign in the user with valid credentials' do
      expect(page).to have_content "Signed in successfully. Signed in as
                                    #{user.first_name} #{user.last_name}"
    end
  end
end
