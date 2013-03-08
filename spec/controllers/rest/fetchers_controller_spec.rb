require 'spec_helper'

describe Rest::FetchersController do
  render_views

  describe "GET #index" do
    it "renders the :index view" do
      fetcher_list = FactoryGirl.create_list(:fetcher, 3)
      get :index, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq fetcher_list.to_json
    end
  end

  describe "GET #show" do
    it "assigns the requested fetcher to @fetcher" do
      fetcher = FactoryGirl.create(:fetcher)
      get :show, id: fetcher, :format => :json
      assigns(:fetcher).should eq (fetcher)
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq fetcher.to_json
    end

    it "gets provider for fetcher" do
      fetcher = FactoryGirl.create(:fetcher)
      get :index, id: fetcher.id, provider_id: fetcher.provider.id, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq [fetcher].to_json
    end

  end
  
end
