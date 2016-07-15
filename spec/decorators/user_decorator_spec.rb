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
      it do
        expect(GivenAnswer).to have_received(:where)
          .with(user_id: user.id)
      end
    end
    context 'when there are 2 GivenAnswers' do
      before do
        allow(GivenAnswer).to receive(:where).and_return([double, double])
        @result = user.answered_counter
      end
      it { expect(@result).to eq(2) }
    end
  end
end
