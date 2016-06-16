require 'rails_helper'

RSpec.feature 'Edit question' do
  given(:user) { build(:user, :admin) }

  background do
    sign_in_user(user)

    visit 'questions/1/edit'

    fill_in 'Intitulé', with: 'nouvelle question'

    click_button 'Modifier'
  end

  scenario 'should update the question with provided data' do
    expect(page).to have_selector 'p.alert.alert-success'
    expect(page).to have_content 'La question a été repondue'
    expect(page).to have_content 'nouvelle question'
  end
end
