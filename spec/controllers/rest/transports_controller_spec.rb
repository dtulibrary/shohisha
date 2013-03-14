require 'spec_helper'

describe Rest::TransportsController do
  render_views

  describe "GET #index" do
    # GET /rest/transports.json
    it "renders view" do
      transport_list = FactoryGirl.create_list(:transport, 3)
      get :index, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq transport_list.to_json
    end

    # GET /rest/transports.html
    it "no html view" do
      get :index
      response.should_not render_template :index
    end
  end

  describe "GET #show" do
    # GET /rest/transports/1.json
    it "assigns and renders @transport" do
      transport = FactoryGirl.create(:transport)
      get :show, id: transport, :format => :json
      assigns(:transport).should eq (transport)
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq transport.to_json
    end
  end
  
end
