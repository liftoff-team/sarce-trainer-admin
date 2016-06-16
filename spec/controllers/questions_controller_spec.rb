require 'rails_helper'

RSpec.describe QuestionsController do
  before(:each) { login_user }

  describe 'GET index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
