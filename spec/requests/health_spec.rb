# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Health Check', type: :request do
  describe 'GET /index' do
    it 'verify if the application is running' do
      get '/'
      expect(response).to have_http_status(:ok)
      expect(response.body).to eq(JSON.generate({ message: "I'm alive :p" }))
    end
  end
end
