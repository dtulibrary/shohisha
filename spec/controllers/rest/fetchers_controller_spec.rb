require 'spec_helper'

describe Rest::FetchersController do
  render_views

  describe "GET #index" do
    # GET /rest/fetchers.json
    it "renders view" do
      fetcher_list = FactoryGirl.create_list(:fetcher, 3)
      get :index, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq fetcher_list.to_json
    end

    # GET /rest/fetchers.html
    it "no html view" do
      get :index
      response.should_not render_template :index
    end

    # GET /rest/providers/1/fetchers.json
    it "renders through providers" do
      fetcher = FactoryGirl.create(:fetcher)
      fetcher2 = FactoryGirl.create(:fetcher, provider_id: fetcher.provider.id)
      fetcher3 = FactoryGirl.create(:fetcher)
      get :index, provider_id: fetcher.provider.id, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq [fetcher, fetcher2].to_json
      get :index, provider_id: fetcher3.provider.id, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq [fetcher3].to_json
    end

    # GET /rest/supplies/1/fetchers.json
    it "renders through supplies" do
      fetcher = FactoryGirl.create(:fetcher)
      get :index, supply_id: fetcher.supply, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq [fetcher].to_json
    end
  end

  describe "GET #show" do
    # GET /rest/fetchers/1.json
    it "assigns and renders @fetcher" do
      fetcher = FactoryGirl.create(:fetcher)
      get :show, id:fetcher, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq fetcher.to_json
    end
  end

end
