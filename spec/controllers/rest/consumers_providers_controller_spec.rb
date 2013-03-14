require 'spec_helper'

describe Rest::ConsumersProvidersController do
  render_views

  before (:each) do
    @consumer = FactoryGirl.create(:consumer)
    @consumer2 = FactoryGirl.create(:consumer)
    @provider = FactoryGirl.create(:provider)
    @provider2 = FactoryGirl.create(:provider)
    @provider3 = FactoryGirl.create(:provider)
    fulltext = FactoryGirl.create(:fulltext)
    @consumer_provider = ConsumersProvider.new(
      { provider_id: @provider.id, consumer_id: @consumer.id,
        fulltext_id: fulltext.id
      }
    )
    @consumer_provider2 = ConsumersProvider.new(
      { provider_id: @provider2.id, consumer_id: @consumer2.id,
        fulltext_id: fulltext.id
      }
    )
    @consumer_provider3 = ConsumersProvider.new(
      { provider_id: @provider3.id, consumer_id: @consumer.id,
        fulltext_id: fulltext.id
      }
    )
    @consumer_provider4 = ConsumersProvider.new(
      { provider_id: @provider3.id, consumer_id: @consumer2.id,
        fulltext_id: fulltext.id
      }
    )
    @provider.consumers_providers = [@consumer_provider]
    @provider2.consumers_providers = [@consumer_provider2]
    @provider3.consumers_providers = [@consumer_provider3, @consumer_provider4]
  end

  describe "GET #index" do
    # GET /rest/consumers_providers.json
    it "renders the view" do
      get :index, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq [@consumer_provider, @consumer_provider2,
          @consumer_provider3, @consumer_provider4].to_json
    end

    # GET /rest/consumers/1/consumers_providers.json
    it "renders through consumer1" do
      get :index, consumer_id: @consumer, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq [@consumer_provider, @consumer_provider3].to_json
    end

    it "renders through consumer2" do
      get :index, consumer_id: @consumer2, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq [@consumer_provider2, @consumer_provider4].to_json
    end

    # GET /rest/providers/1/consumers_providers.json
    it "renders through provider1" do
      get :index, provider_id: @provider, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq [@consumer_provider].to_json
    end

    it "renders through provider2" do
      get :index, provider_id: @provider2, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq [@consumer_provider2].to_json
    end

    it "renders through provider3" do
      get :index, provider_id: @provider3, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq [@consumer_provider3, @consumer_provider4].to_json
    end

    # GET /rest/consumers_providers.html
    it "no html view" do
      get :index
      response.should_not render_template :index
    end
  end

  describe "GET #show" do
    # GET /rest/consumers_providers/1.json
    it "assigns and renders @consumers_providers" do
      get :show, id: @consumer_provider, :format => :json
      assigns(:consumers_providers).should eq (@consumer_provider)
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq @consumer_provider.to_json
    end
  end

end
