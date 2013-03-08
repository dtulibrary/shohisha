require 'spec_helper'

describe Rest::ConsumersProvidersController do
  render_views

  before (:each) do
    @consumer = FactoryGirl.create(:consumer)
    @provider = FactoryGirl.create(:provider)
    fulltext = FactoryGirl.create(:fulltext)
    @consumer_provider = ConsumersProvider.new(
      { provider_id: @provider.id, consumer_id: @consumer.id,
        fulltext_id: fulltext.id
      }
    )
    @provider.consumers_providers = [@consumer_provider]
  end

  describe "GET #index" do
    it "renders the :index view" do
      get :index, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq [@consumer_provider].to_json
    end

    it "renders the consumer :index view" do
      get :index, consumer_id: @consumer, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq [@consumer_provider].to_json
    end

    it "renders the provider :index view" do
      get :index, provider_id: @provider, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq [@consumer_provider].to_json
    end
  end

  describe "GET #show" do
    it "assigns @consumers_providers through consumer" do
      get :show, id: @consumer_provider, consumer_id: @consumer, :format => :json
      assigns(:consumers_providers).should eq (@consumer_provider)
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq @consumer_provider.to_json
    end

    it "assigns @consumers_providers through provider" do
      get :show, id: @consumer_provider, provider_id: @provider, :format => :json
      assigns(:consumers_providers).should eq (@consumer_provider)
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq @consumer_provider.to_json
    end
  end

end
