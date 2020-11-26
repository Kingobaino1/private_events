require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  let(:current_user) { User.create(name: 'Martin', email: 'martin@microverse.org', password: '123456') }
  describe 'GET index' do
    it 'renders the index template' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe 'GET new' do
    it 'renders the index template' do
      get :new
      expect(response.status).to eq(200)
    end
  end
end
