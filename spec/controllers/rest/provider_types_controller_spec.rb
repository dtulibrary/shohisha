require 'spec_helper'

describe Rest::ProviderTypesController do
  render_views

  describe "GET #index" do
    # GET /rest/provider_types.json
    it "renders view" do
      provider_type_list = FactoryGirl.create_list(:provider_type, 3)
      get :index, :format => :json
      expect(response.header['Content-Type']).to include 'application/json'
      expect(response.body).to eq provider_type_list.to_json
    end

    # GET /rest/provider_types.html
    it "no html view" do
      get :index
      expect(response).not_to render_template :index
      expect(response.status).to eq 406
    end
  end

  describe "GET #show" do
    # GET /rest/providers_types/1.json
    it "assigns and renders @provider_type" do
      provider_type = FactoryGirl.create(:provider_type)
      provider_type2 = FactoryGirl.create(:provider_type)
      get :show, id: provider_type, :format => :json
      expect(assigns(:provider_type)).to eq (provider_type)
      expect(response.header['Content-Type']).to include 'application/json'
      expect(response.body).to eq provider_type.to_json
    end
  end
  
end
