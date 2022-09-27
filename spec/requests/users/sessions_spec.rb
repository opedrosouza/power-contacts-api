# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength
RSpec.describe Users::SessionsController, type: :request do
  let(:user) { create(:user) }
  let(:login_url) { '/login' }
  let(:logout_url) { '/logout' }

  context 'When logging in' do
    before do
      post login_url, params: {
        user: {
          email: user.email,
          password: user.password
        }
      }
    end

    it 'returns a token' do
      expect(response.headers['Authorization']).to be_present
    end

    it 'returns 200' do
      expect(response.status).to eq(200)
    end
  end

  context 'When password is missing' do
    before do
      post login_url, params: {
        user: {
          email: user.email,
          password: nil
        }
      }
    end

    it 'returns 401' do
      expect(response.status).to eq(401)
    end
  end

  context 'When logging out' do
    token = nil
    before do
      post login_url, params: {
        user: {
          email: user.email,
          password: user.password
        }
      }
      token = response.headers['Authorization']
    end

    it 'returns 204' do
      request.headers['Authorization'] = token
      delete logout_url

      expect(response).to have_http_status(204)
    end
  end
end
# rubocop:enable Metrics/BlockLength
