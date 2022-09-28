# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe Contacts::ContactsController, type: :request do
  let(:user) { create(:user) }
  let(:contact) { create(:contact) }

  # TODO: write test for logged in users
  context 'when a user is not logged in' do
    describe 'GET /contacts' do
      it 'returns http unauthorized' do
        get '/contacts'
        expect(response).to have_http_status(:unauthorized)
      end
    end

    describe 'GET /contacts/:id' do
      it 'returns http unauthorized' do
        get "/contacts/#{contact.id}"
        expect(response).to have_http_status(:unauthorized)
      end
    end

    describe 'POST /contacts/' do
      it 'returns http unauthorized' do
        post '/contacts'
        expect(response).to have_http_status(:unauthorized)
      end
    end

    describe 'PUT /contacts/:id' do
      it 'returns http unauthorized' do
        put "/contacts/#{contact.id}"
        expect(response).to have_http_status(:unauthorized)
      end
    end

    describe 'DELETE /contacts/:id' do
      it 'returns http unauthorized' do
        delete "/contacts/#{contact.id}"
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
