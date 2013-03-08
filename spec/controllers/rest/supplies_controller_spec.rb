require 'spec_helper'

describe Rest::SuppliesController do
  render_views

  describe "GET #index" do
    it "renders the :index view" do
      supply_list = FactoryGirl.create_list(:supply, 3)
      get :index, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq supply_list.to_json
    end
  end

  describe "GET #show" do
    it "assigns the requested supply to @supply" do
      supply = FactoryGirl.create(:supply)
      get :show, id: supply, :format => :json
      assigns(:supply).should eq (supply)
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq supply.to_json
    end
  end
  
end
