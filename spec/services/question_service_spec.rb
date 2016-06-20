require 'rails_helper'

RSpec.describe QuestionService do
  let(:question) { build_stubbed(:question) }
  subject { described_class.new(question.id) }

  describe '#find_correct_count' do
    context "when question doesn't exist" do
      before { allow(Question).to receive(:find).and_raise(ActiveRecord::RecordNotFound) }

      it "raise an error" do
        expect { subject.find_correct_count }.
        to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    context "when question exists" do
      before { allow(Question).to receive(:find).and_return(question) }

      context "and there is no GivenAnswer" do
        before do
          allow(GivenAnswer).to receive(:where).and_return([])
          @result = subject.find_correct_count
        end
        it { expect(@result).to eq(0) }
        it { expect(GivenAnswer).to have_received(:where).with(question_id: question.id, is_correct: true) }
      end

      context "and there is no correct GivenAnswer" do
        before { allow(GivenAnswer).to receive(:where).and_return([]) }
        it { expect(subject.find_correct_count).to eq(0) }
      end

      context "and there is at least one correct GivenAnswer" do
        let(:given_answer) { double }
        before { allow(GivenAnswer).to receive(:where).and_return([given_answer]) }
        it { expect(subject.find_correct_count).to eq(1) }
      end
    end
  end
end
