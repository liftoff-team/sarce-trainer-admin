require 'rails_helper'

RSpec.feature 'New question' do
  background do
    sign_in_user(user)

    visit 'admin/questions/new'

    fill_in 'Intitulé', with: '0 + 0?'
    fill_in 'text_1', with: 'test'
    check 'checkbox_1'
    fill_in 'text_2', with: 'maison'
    fill_in 'text_3', with: 'oiseau'
    check 'checkbox_3'
    fill_in 'text_4', with: 'ruby'
    fill_in 'Explication', with: 'documentation'
    fill_in 'Documentation', with: 1

    click_button 'Valider'
  end

  context 'an admin wants to create a new question' do
    let(:user) { build(:user, :admin) }

    scenario 'should create a new question with valid data' do
      expect(page).to have_selector 'p.alert.alert-success'
      expect(page).to have_content 'La question a été repondue 0 fois'
      expect(page).to have_content '0 + 0?'
    end
  end
end
