require 'rails_helper'

RSpec.describe "Api::V1::Informations", type: :request do
  describe 'GET /api/v1/informations/:id' do
    context 'when character exist' do
      let(:id) { rand(1...10) }
      before do
        get "/api/v1/informations/#{id}"
      end
      it { expect(response).to have_http_status(:success) }
    end

    context 'when character donts exist' do
      let(:id) { -1 }
      before do
        get "/api/v1/informations/#{id}"
      end
      it { expect(response).to have_http_status(:unprocessable_entity) }
    end
  end
end