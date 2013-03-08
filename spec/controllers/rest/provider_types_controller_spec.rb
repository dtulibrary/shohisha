require 'spec_helper'

describe Rest::ProviderTypesController do
  render_views

  describe "GET #index" do
    it "renders the :index view" do
      provider_type_list = FactoryGirl.create_list(:provider_type, 3)
      get :index, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq provider_type_list.to_json
    end
  end

  describe "GET #show" do
    it "assigns the requested provider_type to @provider_type" do
      provider_type = FactoryGirl.create(:provider_type)
      get :show, id: provider_type, :format => :json
      assigns(:provider_type).should eq (provider_type)
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq provider_type.to_json
    end
  end
  
end
