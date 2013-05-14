require 'spec_helper'

describe Rest::StatusesController do
  render_views

  describe "GET #index" do
    # GET /rest/statuses.json
    it "renders view" do
      status_list = FactoryGirl.create_list(:status, 3)
      get :index, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq status_list.to_json
    end

    # GET /rest/statuses.html
    it "no html view" do
      get :index
      response.should_not render_template :index
    end
  end

  describe "GET #show" do
    # GET /rest/statuses/1.json
    it "assigns and renders @status" do
      status = FactoryGirl.create(:status)
      status2 = FactoryGirl.create(:status)
      get :show, id: status, :format => :json
      assigns(:status).should eq (status)
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq status.to_json
    end
  end

end
