require 'rails_helper'

RSpec.describe UserDecorator do
  describe '#answered_counter' do
    let(:user) { build_stubbed(:user).decorate }

    context 'when there is no GivenAnswer' do
      before do
        allow(GivenAnswer).to receive(:where).and_return([])
        @result = user.answered_counter
      end
      it { expect(@result).to eq(0) }
      it { expect(GivenAnswer).to have_received(:where).with(user_id: user.id) }
    end
    context 'when there are 2 GivenAnswers' do
      before do
        allow(GivenAnswer).to receive(:where).and_return([double, double])
        @result = user.answered_counter
      end
      it { expect(@result).to eq(2) }
    end
  end

  describe '#questions_counter' do
    let(:user) { build_stubbed(:user).decorate }

    context 'when there is no Question' do
      before do
        allow(Question).to receive(:where).and_return([])
        @result = user.questions_counter
      end

      it { expect(@result).to eq(0) }
      it { expect(Question).to have_received(:where).with(author_id: user.id) }
    end

    context 'when there are 3 Questions' do
      before do
        allow(Question).to receive(:where).and_return([double, double, double])
        @result = user.questions_counter
      end

      it { expect(@result).to eq(3) }
      it { expect(Question).to have_received(:where).with(author_id: user.id) }
    end
  end
end
