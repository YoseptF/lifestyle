require 'rails_helper'

RSpec.describe 'Indices', type: :request do
  describe 'GET /indices' do
    it 'works! (now write some real specs)' do
      get '/'
      expect(response).to have_http_status(200)
    end
  end
end
