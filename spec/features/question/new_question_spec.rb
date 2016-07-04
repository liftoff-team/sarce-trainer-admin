require 'rails_helper'

RSpec.feature 'New question', js: true do
  given(:user) { create(:user, :admin) }
  given!(:documentation) { create(:documentation, name: 'incendie') }

  background do
    sign_in_user(user)
    visit new_question_path
  end

  scenario 'should create a new question with valid data' do
    fill_in 'Intitulé', with: '0 + 0?'
    fill_in 'text_1', with: 'test'
    check 'checkbox_1'
    fill_in 'text_2', with: 'maison'
    fill_in 'text_3', with: 'oiseau'
    check 'checkbox_3'
    fill_in 'text_4', with: 'ruby'
    fill_in 'Explication', with: 'explication'
    select 'incendie', from: 'question_documentation_id'
    click_button 'Valider'

    expect(page).to have_selector 'p.alert.alert-success'
    expect(page).to have_content 'La question a été repondue 0 fois'
    expect(page).to have_content '0 + 0?'
  end
end
