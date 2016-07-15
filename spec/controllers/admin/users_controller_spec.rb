require 'rails_helper'

RSpec.describe Admin::UsersController do
  before(:each) { login_admin }

  describe 'GET index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  pending 'PATCH update' do
    # TODO (Arnaud Lenglet): to implement
    # it { expect(UserService.new()).to have_received(:smart_update).with(...)}
  end
end
