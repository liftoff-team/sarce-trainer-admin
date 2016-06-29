require 'rails_helper'

RSpec.feature 'Edit question' do
  given(:user) { create(:user, :admin) }
  given(:question) { create(:question) }

  background do
    sign_in_user(user)
    visit edit_question_path(question.id)
  end

  scenario 'should update the question with provided data' do
    fill_in 'Intitulé', with: 'nouvelle question'
    click_button 'Modifier'

    expect(page).to have_selector 'p.alert.alert-success'
    expect(page).to have_content 'La question a été repondue'
    expect(page).to have_content 'nouvelle question'
  end
end
