require 'rails_helper'

RSpec.describe QuestionService do
  let(:user) { create(:user, :admin) }
  let(:question) { create(:question) }

  before do
    sign_in_user(user)
    visit "questions/#{question.id}"
  end

  it 'should call the Question service object' do
    expect(QuestionService).to respond_to(:new)
  end
end
