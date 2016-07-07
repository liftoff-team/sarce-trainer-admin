require 'rails_helper'

RSpec.feature 'New DailyQuestion', js: true do
  given(:user) { create(:user, :admin) }
  given!(:question) { create(:question, body: 'Pompier') }

  background do
    sign_in_user(user)
    visit new_admin_daily_question_path
  end

  scenario 'should create a new daily question with valid data' do
    select 'Pompier', from: 'daily_question_question_id'
    page.execute_script("$('#datepicker').val('23-01-2016')")
    click_button 'Valider'
    expect(page).to have_content 'Nouvelle question modifiée(e) avec succès'
    expect(page.current_path).to eq(admin_daily_questions_path)
  end
end
