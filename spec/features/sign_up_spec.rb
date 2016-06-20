require 'rails_helper'

RSpec.feature 'Sign up' do
  background do
    visit '/users/sign_up'

    fill_in 'user_first_name', with: user.first_name
    fill_in 'user_last_name', with: user.last_name
    fill_in 'user_cis', with: user.cis
    select 'Sergent', from: 'user_rank'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password
    click_button "S'inscrire"
  end

  context 'a user wants to create a new account' do
    let(:user) { build(:user) }

    scenario 'should sign up the user with valid data' do
      expect(last_email.to).to eq([user.email])
      expect(page).to have_content 'Un message avec un lien de confirmation
                                    vous a été envoyé par mail.'
    end
  end
end
