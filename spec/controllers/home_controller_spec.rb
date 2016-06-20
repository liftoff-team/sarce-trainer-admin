require 'rails_helper'

RSpec.describe HomeController do
  describe 'GET index' do
    it 'redirect to sign in page if there is no current_user' do
      get :index
      expect(response).to have_http_status(:redirect)
    end
  end
end
