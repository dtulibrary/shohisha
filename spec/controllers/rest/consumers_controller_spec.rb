require 'spec_helper'

describe Rest::ConsumersController do
  render_views

  describe "GET #index" do
    # GET /rest/consumers.json
    it "renders view" do
      consumer_list = FactoryGirl.create_list(:consumer, 3)
      get :index, :format => :json
      expect(response.header['Content-Type']).to include('application/json')
      expect(response.body).to eq consumer_list.to_json
    end

    # GET /rest/packages/1/consumers.json
    it "renders through packages" do
      consumer = FactoryGirl.create(:consumer)
      consumer2 = FactoryGirl.create(:consumer)
      consumer3 = FactoryGirl.create(:consumer)
      consumer4 = FactoryGirl.create(:consumer)
      fulltext = FactoryGirl.create(:fulltext)
      package = FactoryGirl.create(:package)
      package2 = FactoryGirl.create(:package)
      package.consumers_packages = [
        ConsumersPackage.new(
          { consumer_id: consumer.id, fulltext_id: fulltext.id }
        ),
        ConsumersPackage.new(
          { consumer_id: consumer2.id, fulltext_id: fulltext.id }
        ),
        ConsumersPackage.new(
          { consumer_id: consumer3.id, fulltext_id: fulltext.id }
        )
      ]
      package2.consumers_packages = [
        ConsumersPackage.new(
          { consumer_id: consumer3.id, fulltext_id: fulltext.id }
        ),
        ConsumersPackage.new(
          { consumer_id: consumer4.id, fulltext_id: fulltext.id }
        )
      ]
      get :index, package_id: package, :format => :json
      expect(response.header['Content-Type']).to include('application/json')
      expect(response.body).to eq [consumer, consumer2, consumer3].to_json
      get :index, package_id: package2, :format => :json
      expect(response.header['Content-Type']).to include('application/json')
      expect(response.body).to eq [consumer3, consumer4].to_json
    end

    # GET /rest/providers/1/consumers.json
    # GET /rest/providers/2/consumers.json
    it "renders through providers" do
      consumer = FactoryGirl.create(:consumer)
      consumer2 = FactoryGirl.create(:consumer)
      consumer3 = FactoryGirl.create(:consumer)
      consumer4 = FactoryGirl.create(:consumer)
      fulltext = FactoryGirl.create(:fulltext)
      provider = FactoryGirl.create(:provider)
      provider2 = FactoryGirl.create(:provider)
      provider.consumers_providers = [
        ConsumersProvider.new(
          { consumer_id: consumer.id, fulltext_id: fulltext.id }
        ),
        ConsumersProvider.new(
          { consumer_id: consumer2.id, fulltext_id: fulltext.id }
        ),
        ConsumersProvider.new(
          { consumer_id: consumer3.id, fulltext_id: fulltext.id }
        ),
      ]
      provider2.consumers_providers = [
        ConsumersProvider.new(
          { consumer_id: consumer3.id, fulltext_id: fulltext.id }
        ),
        ConsumersProvider.new(
          { consumer_id: consumer4.id, fulltext_id: fulltext.id }
        ),
      ]
      get :index, provider_id: provider, :format => :json
      expect(response.header['Content-Type']).to include('application/json')
      expect(response.body).to eq [consumer, consumer2, consumer3].to_json
      get :index, provider_id: provider2, :format => :json
      expect(response.header['Content-Type']).to include('application/json')
      expect(response.body).to eq [consumer3, consumer4].to_json
    end

    # GET /rest/consumers.html
    it "no html view" do
      get :index
      expect(response).not_to render_template :index
      expect(response.status).to eq 406
    end
  end

  describe "GET #show" do
    # GET /rest/consumers/1.json
    it "assigns and renders @consumer" do
      consumer = FactoryGirl.create(:consumer)
      consumer2 = FactoryGirl.create(:consumer)
      get :show, id: consumer, :format => :json
      expect(assigns(:consumer)).to eq (consumer)
      expect(response.header['Content-Type']).to include 'application/json'
      expect(response.body).to eq consumer.to_json
    end
  end
  
end
