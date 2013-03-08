require 'spec_helper'

describe Rest::TransportsController do
  render_views

  describe "GET #index" do
    it "renders the :index view" do
      transport_list = FactoryGirl.create_list(:transport, 3)
      get :index, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq transport_list.to_json
    end
  end

  describe "GET #show" do
    it "assigns the requested transport to @transport" do
      transport = FactoryGirl.create(:transport)
      get :show, id: transport, :format => :json
      assigns(:transport).should eq (transport)
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq transport.to_json
    end
  end
  
end
