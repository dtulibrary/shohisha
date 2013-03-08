require 'spec_helper'

describe Rest::RetainsController do
  render_views

  describe "GET #index" do
    it "renders the :index view" do
      retain_list = FactoryGirl.create_list(:retain, 3)
      get :index, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq retain_list.to_json
    end
  end

  describe "GET #show" do
    it "assigns the requested retain to @retain" do
      retain = FactoryGirl.create(:retain)
      get :show, id: retain, :format => :json
      assigns(:retain).should eq (retain)
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq retain.to_json
    end
  end
  
end
