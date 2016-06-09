module FeaturesHelpers
  include Capybara::DSL

  def sign_in_user(user)
    user.confirm
    visit '/users/sign_in'
    fill_in 'Email', with: user.email
    fill_in 'Mot de passe', with: user.password
    click_button 'Connexion'
  end
end
