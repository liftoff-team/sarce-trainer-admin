require 'rails_helper'

RSpec.describe QuestionDecorator do

  describe '#last_answers' do
    let(:number) { 3 }
    let(:question) { build_stubbed(:question).decorate }

    context 'when there is no GivenAnswer' do
      before do
        allow(GivenAnswer).to receive(:where).and_return([])
        @result = question.last_answers(number)
      end
      it { expect(@result.count).to eq(0) }
      it { expect(GivenAnswer).to have_received(:where).with(question_id: question.id) }
    end

    context 'when there are between 1 and `number` GivenAnswers' do
      before do
        allow(GivenAnswer).to receive(:where).and_return([double, double])
        @result = question.last_answers(number)
      end
      it { expect(@result.count).to eq(2) }
    end

    context 'when there more than `number` GivenAnswer' do
      let(:given_answers) { [double]*5 }
      before do
        allow(GivenAnswer).to receive(:where).and_return(given_answers)
        allow(given_answers).to receive(:last).and_call_original
        @result = question.last_answers(number)
      end
      it { expect(@result.count).to eq(number) }
      it { expect(given_answers).to have_received(:last).with(number) }
    end
  end
end
