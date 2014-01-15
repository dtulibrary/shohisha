require 'spec_helper'

describe Rest::SuppliesController do
  render_views

  describe "GET #index" do
    # GET /rest/supplies.json
    it "renders view" do
      supply_list = FactoryGirl.create_list(:supply, 3)
      get :index, :format => :json
      expect(response.header['Content-Type']).to include 'application/json'
      expect(response.body).to eq supply_list.to_json
    end

    # GET /rest/supplies.html
    it "no html view" do
      get :index
      expect(response).not_to render_template :index
      expect(response.status).to eq 406
    end
  end

  describe "GET #show" do
    # GET /rest/supplies/1.json
    it "assigns and renders @supply" do
      supply = FactoryGirl.create(:supply)
      supply2 = FactoryGirl.create(:supply)
      get :show, id: supply, :format => :json
      expect(assigns(:supply)).to eq (supply)
      expect(response.header['Content-Type']).to include 'application/json'
      expect(response.body).to eq supply.to_json
    end
  end
  
end
