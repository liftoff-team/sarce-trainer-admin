class FeaturesSpecHelper
  include Capybara::DSL

  def sign_in(user)
    user.confirm
    visit '/users/sign_in'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'
  end
end
