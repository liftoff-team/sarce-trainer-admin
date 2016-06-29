require 'rails_helper'

RSpec.describe MyProfilesController do
  before(:each) { login_admin }

  describe 'GET show' do
    it 'returns http success' do
      get :show
      expect(response).to have_http_status(:success)
    end
  end
end
