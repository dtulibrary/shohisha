require 'spec_helper'

describe Rest::ProvidersController do
  render_views

  describe "GET #index" do
    # GET /rest/providers.json
    it "renders view" do
      provider_list = FactoryGirl.create_list(:provider, 3)
      get :index, :format => :json
      expect(response.header['Content-Type']).to include 'application/json'
      expect(response.body).to eq provider_list.to_json
    end

    # GET /rest/fetchers/1/providers.json
    it "renders through fetchers" do
      fetcher = FactoryGirl.create(:fetcher)
      fetcher2 = FactoryGirl.create(:fetcher)
      get :index, fetcher_id: fetcher, :format => :json
      expect(response.header['Content-Type']).to include 'application/json'
      expect(response.body).to eq [fetcher.provider].to_json
    end

    # GET /rest/consumers/1/providers.json
    it "renders through consumers" do
      consumer = FactoryGirl.create(:consumer)
      consumer2 = FactoryGirl.create(:consumer)
      provider = FactoryGirl.create(:provider)
      provider2 = FactoryGirl.create(:provider)
      provider3 = FactoryGirl.create(:provider)
      provider4 = FactoryGirl.create(:provider)
      fulltext = FactoryGirl.create(:fulltext)
      consumer.consumers_providers = [
        ConsumersProvider.new(
          { provider_id: provider.id, fulltext_id: fulltext.id }
        ),
        ConsumersProvider.new(
          { provider_id: provider2.id, fulltext_id: fulltext.id }
        ),
        ConsumersProvider.new(
          { provider_id: provider3.id, fulltext_id: fulltext.id }
        ),
      ]
      consumer2.consumers_providers = [
        ConsumersProvider.new(
          { provider_id: provider3.id, fulltext_id: fulltext.id }
        ),
        ConsumersProvider.new(
          { provider_id: provider4.id, fulltext_id: fulltext.id }
        ),
      ]
      get :index, consumer_id: consumer, :format => :json
      expect(response.header['Content-Type']).to include 'application/json'
      expect(response.body).to eq [provider, provider2, provider3].to_json
      get :index, consumer_id: consumer2, :format => :json
      expect(response.header['Content-Type']).to include 'application/json'
      expect(response.body).to eq [provider3, provider4].to_json
    end

    # GET /rest/packages/1/providers.json
    it "renders through packages" do
      package = FactoryGirl.create(:package)
      package2 = FactoryGirl.create(:package)
      get :index, package_id: package, :format => :json
      expect(response.header['Content-Type']).to include 'application/json'
      expect(response.body).to eq [package.provider].to_json
    end

    # GET /rest/provider_types/1/providers.json
    it "renders through provider_types" do
      provider = FactoryGirl.create(:provider)
      provider2 = FactoryGirl.create(:provider)
      get :index, provider_type_id: provider.provider_type, :format => :json
      expect(response.header['Content-Type']).to include 'application/json'
      expect(response.body).to eq [provider].to_json
    end

    # GET /rest/providers.html
    it "no html view" do
      get :index
      expect(response).not_to render_template :index
      expect(response.status).to eq 406
    end
  end

  describe "GET providercode#code" do
    # GET /rest/providercode/code.json
    it "renders json" do
      provider = FactoryGirl.create(:provider)
      get :code, code: provider.code, :format => :json
      expect(response.header['Content-Type']).to include 'application/json'
      expect(response.body).to eq provider.to_json
    end

    # GET /rest/providercode/code.text
    it "renders text" do
      provider = FactoryGirl.create(:provider)
      get :code, code: provider.code, :format => :text
      expect(response.header['Content-Type']).to include 'text/plain'
      expect(response.body).to eq "#{provider.id}"
    end

    # GET /rest/providercode/code.text
    it "renders text" do
      provider = FactoryGirl.create(:provider)
      get :code, code: 'fakecode', :format => :text
      expect(response.header['Content-Type']).to include 'text/plain'
      expect(response.status).to eq 404
    end
  end

  describe "GET #show" do
    # GET /rest/providers/1.json
    it "assigns and renders @provider" do
      provider = FactoryGirl.create(:provider)
      provider2 = FactoryGirl.create(:provider)
      get :show, id: provider, :format => :json
      expect(assigns(:provider)).to eq (provider)
      expect(response.header['Content-Type']).to include 'application/json'
      expect(response.body).to eq provider.to_json
    end
  end
  
end
