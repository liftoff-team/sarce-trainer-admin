require 'rails_helper'

RSpec.describe UserService do
  let(:user) { build_stubbed(:user) }
  let(:base_params) {{ user: { first_name: user.first_name,
                          last_name: user.last_name,
                          cis: user.cis,
                          rank: user.rank,
                          email: user.email }
                    }}
  subject { described_class.new(user: user) }
  before { allow(user).to receive(:update).and_return(true) }

  describe '#smart_update' do

    context 'when the password is empty in params' do
      let(:params) {{ user: base_params[:user].merge(
                                password: '',
                                password_confirmation: '')
                   }}
      let(:cleaned_params) do
        params.tap do |params|
          params[:user].delete(:password)
          params[:user].delete(:password_confirmation)
        end
      end

      before { @result = subject.smart_update(params) }

      it { expect(@result).to be_an_instance_of(User) }
      it { expect(user).to have_received(:update).with(cleaned_params[:user]) }
    end

    context 'when the password is in params' do

      context "when the password doesn't match password confirmation" do
        let(:params) {{ user: base_params[:user].merge(
                                password: 'azerty',
                                password_confirmation: 'ytreza')
                     }}

        before { allow(user).to receive(:update).and_return(false) }

        it do
          expect { subject.smart_update(params) }.
          to raise_error(Sarce::PasswordMismatchException)
        end
      end

      context 'when the password match password confirmation' do
        let(:params) {{ user: base_params[:user].merge(
                                password: 'azerty',
                                password_confirmation: 'azerty')
                   }}
        before { subject.smart_update(params) }
        it { expect(user).to have_received(:update).with(params[:user]) }
      end
    end
  end
end
