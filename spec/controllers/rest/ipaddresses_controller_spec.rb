require 'spec_helper'

describe Rest::IpaddressesController do
  render_views

  describe "GET #index" do
    # GET /rest/ipadresses.json
    it "renders view" do
      ip_list = FactoryGirl.create_list(:ipaddress, 3)
      get :index, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq ip_list.to_json
    end

    # GET /rest/ipaddresses.html
    it "no html view" do
      get :index
      response.should_not render_template :index
    end
  end

  describe "GET #show" do
    # GET /rest/ipadresses/1.json
    it "assigns and renders @ipaddress" do
      ipaddress = FactoryGirl.create(:ipaddress)
      get :show, id: ipaddress, :format => :json
      assigns(:ipaddress).should eq (ipaddress)
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq ipaddress.to_json
    end
  end
  
end
