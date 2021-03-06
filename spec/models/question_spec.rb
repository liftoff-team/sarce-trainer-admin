require 'rails_helper'

RSpec.describe Question do
  subject(:question) { build(:question) }

  describe 'validations' do
    it { is_expected.to be_valid }

    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_presence_of(:answers) }
    it { is_expected.to validate_presence_of(:correct_answers) }
    it { is_expected.to validate_presence_of(:explanation) }
    it { is_expected.to validate_presence_of(:documentation_id) }
    it { is_expected.to validate_presence_of(:answer_counter) }
    it { is_expected.to validate_presence_of(:positive_rates) }
    it { is_expected.to validate_presence_of(:negative_rates) }
  end

  describe 'correct_answers is not valid if empty' do
    subject { build(:question, correct_answers: []) }
    it { is_expected.to_not be_valid }
  end

  describe 'association' do
    it { is_expected.to belong_to(:documentation) }
  end

  describe 'attributes' do
    it { expect(question.answers).to include(*question.correct_answers) }
  end

  describe 'public instance methods' do
    context 'responds to its methods' do
      it { expect(question).to respond_to(:correct_count) }
      it { expect(question).to respond_to(:correct_ratio) }
      it { expect(question).to respond_to(:total_rates) }
      it { expect(question).to respond_to(:like_ratio) }
      it { expect(question).to respond_to(:convert_correct_answers) }
    end

    context 'executes methods correctly' do
      context 'self.correct_ratio' do
        it { expect(question.correct_ratio.nan?).to be_falsy }
      end
      context 'self.like_ratio' do
        it { expect(question.like_ratio.nan?).to be_falsy }
      end
      context 'self.convert_correct_answers' do
        before { question.update(correct_answers: %w(1 3)) }

        it do
          expect(question.correct_answers).to eq([question.answers[1],
                                                  question.answers[3]])
        end
      end
    end
  end
end
