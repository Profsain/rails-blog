# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) { get users_path }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /:id' do
    before(:example) { get '/users' }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
  end
end
