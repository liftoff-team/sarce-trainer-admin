require 'rails_helper'

RSpec.describe DailyQuestionDecorator do
  describe '#question_body' do
    let(:daily_question) { build(:daily_question).decorate }
    let(:question) { daily_question.question }

    it { expect(daily_question.question_body).to eq(question.body) }
  end
end
