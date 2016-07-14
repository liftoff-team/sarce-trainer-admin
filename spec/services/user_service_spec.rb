require 'rails_helper'

RSpec.describe UserService do
  let(:user) { build_stubbed(:user) }
  subject { described_class.new(user: user) }

  describe '#smart_update' do
    context 'when the password is empty in params' do
      let!(:params) {{ user: {
                              first_name: user.first_name,
                              last_name: user.last_name,
                              cis: user.cis,
                              rank: user.rank,
                              email: user.email,
                              password:'',
                              password_confirmation: ''
                    }}}
      let!(:cleaned_params) do
        params.tap do |params|
          params[:user].delete(:password)
          params[:user].delete(:password_confirmation)
        end
      end

      before do
        allow(user).to receive(:update).and_return(true)
        @result = subject.smart_update(params)
      end

      it { expect(@result).to be_an_instance_of(User) }
      it { expect(user).to receive(:update).with(cleaned_params) }

    end

    context ' when the password is in params' do
      context "when the password doesn't math password confirmation" do
      end
      context 'when the password math password confirmation' do
      end
    end
  end
end
