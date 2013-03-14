require 'spec_helper'

describe Rest::SuppliesController do
  render_views

  describe "GET #index" do
    # GET /rest/supplies.json
    it "renders view" do
      supply_list = FactoryGirl.create_list(:supply, 3)
      get :index, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq supply_list.to_json
    end

    # GET /rest/supplies.html
    it "no html view" do
      get :index
      response.should_not render_template :index
    end
  end

  describe "GET #show" do
    # GET /rest/supplies/1.json
    it "assigns and renders @supply" do
      supply = FactoryGirl.create(:supply)
      get :show, id: supply, :format => :json
      assigns(:supply).should eq (supply)
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq supply.to_json
    end
  end
  
end
