require 'rails_helper'

RSpec.describe Api::V1::AccountsController, type: :controller do

  describe "GET #show valid" do
    before do
      @acf = AccountCreationFacade.new
      get :show, params: { id: @acf.request[:id], secret_key: @acf.request[:secret_key] }
    end
    let(:json){ JSON.parse(response.body) }

    it { expect(response).to have_http_status(:ok) }
    it { expect(json).to include("id") }
    it { expect(json).to include("acc_hash") }
    it { expect(json).not_to include("secret_key") }
    it { expect(json).not_to include("nonce") }
    it { expect(json).not_to include("timestamp") }
  end

  describe "GET #show not valid" do
    before do
      @acf = AccountCreationFacade.new
      @acf2 = AccountCreationFacade.new
      get :show, params: { id: @acf.request[:id], secret_key: @acf2.request[:secret_key] }
    end
    let(:json){ JSON.parse(response.body) }

    it { expect(response).to have_http_status(:not_acceptable) }
    it { expect(json).not_to include("id") }
    it { expect(json).not_to include("acc_hash") }
    it { expect(json).not_to include("secret_key") }
    it { expect(json).not_to include("nonce") }
    it { expect(json).not_to include("timestamp") }
  end

  describe "POST #create" do
    before{ post :create }
    let(:json){ JSON.parse(response.body) }

    it { expect(response).to have_http_status(:created) }
    it { expect(json).to include("id") }
    it { expect(json).to include("acc_hash") }
    it { expect(json).to include("secret_key") }
    it { expect(json).to include("status") }
  end

end
