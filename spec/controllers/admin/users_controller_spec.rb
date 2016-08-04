require 'rails_helper'

RSpec.describe Admin::UsersController do
  before(:each) { login_admin }

  describe 'GET index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PATCH update' do
    let(:user) { create(:user) }
    let(:user_service) { UserService.new(user: user) }
    let(:update_params) { { cis: 'OSNY' } }

    before do
      allow(user_service).to receive(:smart_update).and_call_original
      patch :update, id: user.id, user: update_params
    end

    it { expect(response).to have_http_status(:success) }
    it { expect(user_service).to have_received(:smart_update).with(update_params)}
  end
end
