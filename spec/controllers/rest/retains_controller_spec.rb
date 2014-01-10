require 'spec_helper'

describe Rest::RetainsController do
  render_views

  describe "GET #index" do
    # GET /rest/retains.json
    it "renders view" do
      retain_list = FactoryGirl.create_list(:retain, 3)
      get :index, :format => :json
      expect(response.header['Content-Type']).to include 'application/json'
      expect(response.body).to eq retain_list.to_json
    end

    # GET /rest/retains.html
    it "no html view" do
      get :index
      expect(response).not_to render_template :index
      expect(response.status).to eq 406
    end
  end

  describe "GET #show" do
    # GET /rest/retains/1.json
    it "assigns and renders @retain" do
      retain = FactoryGirl.create(:retain)
      retain2 = FactoryGirl.create(:retain)
      get :show, id: retain, :format => :json
      expect(assigns(:retain)).to eq (retain)
      expect(response.header['Content-Type']).to include 'application/json'
      expect(response.body).to eq retain.to_json
    end
  end
  
end
