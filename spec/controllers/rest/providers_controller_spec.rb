require 'spec_helper'

describe Rest::ProvidersController do
  render_views

  describe "GET #index" do
    it "renders the :index view" do
      provider_list = FactoryGirl.create_list(:provider, 3)
      get :index, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq provider_list.to_json
    end

    it "renders the fetcher view" do
      fetcher = FactoryGirl.create(:fetcher)
      get :index, id: fetcher.provider, fetcher_id: fetcher, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq [fetcher.provider].to_json
    end

    it "renders the consumer view" do
      consumer = FactoryGirl.create(:consumer)
      provider = FactoryGirl.create(:provider)
      fulltext = FactoryGirl.create(:fulltext)
      provider.consumers_providers = [
        ConsumersProvider.new(
          { consumer_id: consumer.id, fulltext_id: fulltext.id }
        )
      ]
      get :index, id: provider, consumer_id: consumer, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq consumer.providers.to_json
    end

  end

  describe "GET providercode#code" do
    it "return the json for code lookup" do
      provider = FactoryGirl.create(:provider)
      get :code, code: provider.code, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq provider.to_json
    end

    it "return the id for code lookup" do
      provider = FactoryGirl.create(:provider)
      get :code, code: provider.code, :format => :text
      response.header['Content-Type'].should include 'text/plain'
      response.body.should eq "#{provider.id}"
    end

  end

  describe "GET #show" do
    it "assigns the requested provider to @provider" do
      provider = FactoryGirl.create(:provider)
      get :show, id: provider, :format => :json
      assigns(:provider).should eq (provider)
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq provider.to_json
    end
  end
  
end
