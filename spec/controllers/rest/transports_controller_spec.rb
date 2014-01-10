require 'spec_helper'

describe Rest::TransportsController do
  render_views

  describe "GET #index" do
    # GET /rest/transports.json
    it "renders view" do
      transport_list = FactoryGirl.create_list(:transport, 3)
      get :index, :format => :json
      expect(response.header['Content-Type']).to include 'application/json'
      expect(response.body).to eq transport_list.to_json
    end

    # GET /rest/transports.html
    it "no html view" do
      get :index
      expect(response).not_to render_template :index
      expect(response.status).to eq 406
    end
  end

  describe "GET #show" do
    # GET /rest/transports/1.json
    it "assigns and renders @transport" do
      transport = FactoryGirl.create(:transport)
      transport2 = FactoryGirl.create(:transport)
      get :show, id: transport, :format => :json
      expect(assigns(:transport)).to eq (transport)
      expect(response.header['Content-Type']).to include 'application/json'
      expect(response.body).to eq transport.to_json
    end
  end
  
end
