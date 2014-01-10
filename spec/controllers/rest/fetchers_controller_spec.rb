require 'spec_helper'

describe Rest::FetchersController do
  render_views

  describe "GET #index" do
    before :each do
      @fetcher1 = FactoryGirl.create(:fetcher)
      @fetcher2 = FactoryGirl.create(:fetcher,
        provider_id: @fetcher1.provider.id,
        supply_id: @fetcher1.supply.id,
        status_id: @fetcher1.status.id)
      @fetcher3 = FactoryGirl.create(:fetcher,
        deliver_period_id: @fetcher1.deliver_period.id,
        transport_id: @fetcher1.transport.id,
        retain_id: @fetcher1.retain.id)
      @fetcher_list = [@fetcher1, @fetcher2, @fetcher3]
    end

    # GET /rest/fetchers.json
    it "renders view" do
      get :index, :format => :json
      expect(response.header['Content-Type']).to include 'application/json'
      expect(response.body).to eq @fetcher_list.to_json
    end

    # GET /rest/fetchers.html
    it "no html view" do
      get :index
      expect(response).not_to render_template :index
      expect(response.status).to eq 406
    end

    # GET /rest/providers/1/fetchers.json
    it "renders through providers" do
      get :index, provider_id: @fetcher1.provider.id, :format => :json
      expect(response.header['Content-Type']).to include 'application/json'
      expect(response.body).to eq [@fetcher1, @fetcher2].to_json
      get :index, provider_id: @fetcher3.provider.id, :format => :json
      expect(response.header['Content-Type']).to include 'application/json'
      expect(response.body).to eq [@fetcher3].to_json
    end

    # GET /rest/supplies/1/fetchers.json
    it "renders through supplies" do
      get :index, supply_id: @fetcher1.supply, :format => :json
      expect(response.header['Content-Type']).to include 'application/json'
      expect(response.body).to eq [@fetcher1, @fetcher2].to_json
    end

    # GET /rest/statuses/1/fetchers.json
    it "renders through status" do
      get :index, status_id: @fetcher1.status, :format => :json
      expect(response.header['Content-Type']).to include 'application/json'
      expect(response.body).to eq [@fetcher1, @fetcher2].to_json
    end

    # GET /rest/transports/1/fetchers.json
    it "renders through transport" do
      get :index, transport_id: @fetcher1.transport, :format => :json
      expect(response.header['Content-Type']).to include 'application/json'
      expect(response.body).to eq [@fetcher1, @fetcher3].to_json
    end

    # GET /rest/retains/1/fetchers.json
    it "renders through retain" do
      get :index, retain_id: @fetcher1.retain, :format => :json
      expect(response.header['Content-Type']).to include 'application/json'
      expect(response.body).to eq [@fetcher1, @fetcher3].to_json
    end

    # GET /rest/deliver_period/1/fetchers.json
    it "renders through deliver_period" do
      get :index, deliver_period_id: @fetcher1.deliver_period, :format => :json
      expect(response.header['Content-Type']).to include 'application/json'
      expect(response.body).to eq [@fetcher1, @fetcher3].to_json
    end

  end

  describe "GET #show" do
    before :each do
      @fetcher1 = FactoryGirl.create(:fetcher)
      @fetcher2 = FactoryGirl.create(:fetcher)
    end

    # GET /rest/fetchers/1.json
    it "assigns and renders @fetcher" do
      get :show, id: @fetcher1, :format => :json
      expect(response.header['Content-Type']).to include 'application/json'
      expect(response.body).to eq @fetcher1.to_json
    end
  end

end
