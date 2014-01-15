require 'spec_helper'

describe Rest::StatusesController do
  render_views

  describe "GET #index" do
    # GET /rest/statuses.json
    it "renders view" do
      status_list = FactoryGirl.create_list(:status, 3)
      get :index, :format => :json
      expect(response.header['Content-Type']).to include 'application/json'
      expect(response.body).to eq status_list.to_json
    end

    # GET /rest/statuses.html
    it "no html view" do
      get :index
      expect(response).not_to render_template :index
      expect(response.status).to eq 406
    end
  end

  describe "GET #show" do
    # GET /rest/statuses/1.json
    it "assigns and renders @status" do
      status = FactoryGirl.create(:status)
      status2 = FactoryGirl.create(:status)
      get :show, id: status, :format => :json
      expect(assigns(:status)).to eq (status)
      expect(response.header['Content-Type']).to include 'application/json'
      expect(response.body).to eq status.to_json
    end
  end

end
