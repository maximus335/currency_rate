# frozen_string_literal: true

require 'rails_helper'

describe HomeController, type: :controller do
  describe 'GET #index' do
    subject { response }

    before do
      allow(controller).to receive(:authenticate_user!).and_return(true)
      stub_request(:get, /cbr/).to_return(body: body)
      get :index
    end

    let(:body) { %(<Valute ID="R01235"><Value>#{rate}</Value></Valute>) }
    let(:rate) { '68.3456' }

    it 'return ok response' do
      is_expected.to have_http_status(:ok)
      expect(assigns(:rate)).to eq(rate)
    end

    it 'return index template' do
      expect(response).to render_template(:index)
    end
  end
end
