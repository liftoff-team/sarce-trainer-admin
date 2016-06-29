require 'rails_helper'

RSpec.describe RegistrationsController do
  before(:each) { login_admin }

  describe 'POST create' do
    it 'returns http success' do
      post :create
      expect(response).to have_http_status(302)
    end
  end
end
