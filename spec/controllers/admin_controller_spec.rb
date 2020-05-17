# frozen_string_literal: true

require 'rails_helper'

describe AdminController, type: :controller do
  include Devise::Test::ControllerHelpers

  before do
    allow(controller).to receive(:authenticate_user!).and_return(true)
    allow(controller).to receive(:current_user).and_return(user)
  end

  let(:user) { create(:user, email: 'test@test.com', password: 'password') }

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
   subject(:request) { post :create, params: { force_rate: params } }

    context 'with valid params' do
      let(:params) { { rate: 70.0, expire_datetime: '17-05-2020 4:29 PM'} }

      it 'create force rate' do
        expect { request }.to change { ForceRate.count }.by(1)
      end
    end

    context 'with invalid params' do
      let(:params) { { rate: nil, expire_datetime: '17-05-2020 4:29 PM'} }

      it 'donn`t create force rate' do
        expect { request }.to_not change { ForceRate.count }
      end

      it 'render new template' do
        request
        expect(response).to render_template :new
      end
    end
  end
end
