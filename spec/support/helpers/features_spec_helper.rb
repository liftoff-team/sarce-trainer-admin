module FeaturesHelpers
  include Capybara::DSL

  def sign_in_user(user = nil)
    user ||= create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Mot de passe', with: user.password
    click_button 'Connexion'
  end
end
