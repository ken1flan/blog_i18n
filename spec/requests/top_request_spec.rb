require 'rails_helper'

RSpec.describe 'Tops', type: :request do
  describe 'GET /index' do
    it 'expect to response ok' do
      get root_path
      expect(response).to have_http_status(:ok)
    end
  end
end
