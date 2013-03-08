require 'spec_helper'

describe Rest::IpaddressesController do
  render_views

  describe "GET #index" do
    it "renders the :index view" do
      ip_list = FactoryGirl.create_list(:ipaddress, 3)
      get :index, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq ip_list.to_json
    end
  end

  describe "GET #show" do
    it "assigns the requested ipaddress to @ipaddress" do
      ipaddress = FactoryGirl.create(:ipaddress)
      get :show, id: ipaddress, :format => :json
      assigns(:ipaddress).should eq (ipaddress)
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq ipaddress.to_json
    end
  end
  
end
