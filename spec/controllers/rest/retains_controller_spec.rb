require 'spec_helper'

describe Rest::RetainsController do
  render_views

  describe "GET #index" do
    # GET /rest/retains.json
    it "renders view" do
      retain_list = FactoryGirl.create_list(:retain, 3)
      get :index, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq retain_list.to_json
    end

    # GET /rest/retains.html
    it "no html view" do
      get :index
      response.should_not render_template :index
    end
  end

  describe "GET #show" do
    # GET /rest/retains/1.json
    it "assigns and renders @retain" do
      retain = FactoryGirl.create(:retain)
      retain2 = FactoryGirl.create(:retain)
      get :show, id: retain, :format => :json
      assigns(:retain).should eq (retain)
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq retain.to_json
    end
  end
  
end
