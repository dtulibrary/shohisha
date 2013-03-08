require 'spec_helper'

describe Rest::StatusesController do
  render_views

  describe "GET #index" do
    it "renders the :index view" do
      status_list = FactoryGirl.create_list(:status, 3)
      get :index, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq status_list.to_json
    end
  end

  describe "GET #show" do
    it "assigns the requested status to @status" do
      status = FactoryGirl.create(:status)
      get :show, id: status, :format => :json
      assigns(:status).should eq (status)
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq status.to_json
    end
  end

end
