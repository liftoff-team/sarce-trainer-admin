require 'rails_helper'

feature 'I can reset my password' do
  subject(:user) { create(:user) }

  scenario 'I forgot my password and need to regenerate it' do
    user.confirm

    visit('/users/sign_in')
    click_on('Forgot your password?')

    fill_in('user_email', with: user.email)
    click_on('Send me reset password instructions')

    expect(page).to have_content 'You will receive an email with instructions
                                  on how to reset your password in a few
                                  minutes.'
    last_email.to.should include(user.email)
  end
end
