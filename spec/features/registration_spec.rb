require 'rails_helper'

feature 'Signing up' do
  subject(:user) { build(:user) }

  scenario 'Signing up with valid data' do
    visit '/'
    click_on('Register')

    fill_in('user_first_name', with: user.first_name)
    fill_in('user_last_name', with: user.last_name)
    fill_in('user_cis', with: user.cis)
    select('Sergent', from: 'user_rank')
    fill_in('user_email', with: user.email)
    fill_in('user_password', with: user.password)
    fill_in('user_password_confirmation', with: user.password)
    click_button 'Sign up'

    last_email.to.should include(user.email)
    expect(page).to have_content 'A message with a confirmation link has been
                                  sent to your email address'

    User.find_by(email: user.email).confirm
  end
end

feature 'Signing in' do
  subject(:user) { create(:user) }

  scenario 'Signing in with valid credentials' do
    user.confirm

    visit '/'
    click_on('Sign in')

    fill_in('user_email', with: user.email)
    fill_in('user_password', with: user.password)
    click_button 'Log in'

    expect(page).to have_content "Signed in successfully. Signed in as
                                  #{user.first_name} #{user.last_name}"
  end
end
