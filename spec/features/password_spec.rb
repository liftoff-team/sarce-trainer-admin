require 'rails_helper'

RSpec.feature 'Password reset' do
  given(:user) { create(:user) }

  background do
    visit user_session_path
  end

  scenario 'should send password reset instructions' do
    click_on 'Mot de passe oublié ?'
    fill_in 'user_email', with: user.email
    click_button 'Renvoyez-moi un nouveau mot de passe'

    expect(page).to have_content 'Vous allez recevoir sous quelques minutes un
                                  email vous indiquant comment réinitialiser
                                  votre mot de passe'
    expect(last_email.to).to eq([user.email])
  end
end
