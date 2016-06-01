require 'rails_helper'

RSpec.feature 'Password reset' do
  background do
    user.confirm

    visit '/users/sign_in'
    click_on 'Forgot your password?'

    fill_in 'user_email', with: user.email
    click_button 'Send me reset password instructions'
  end

  context 'a user lost its password' do
    let(:user) { build(:user) }

    scenario 'should send password reset instructions' do
      expect(page).to have_content 'You will receive an email with instructions
                                    on how to reset your password in a few
                                    minutes.'
      expect(last_email.to).to eq([user.email])
    end
  end
end
