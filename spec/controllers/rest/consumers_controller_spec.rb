require 'spec_helper'

describe Rest::ConsumersController do
  render_views

  describe "GET #index" do
    it "renders the :index view" do
      consumer_list = FactoryGirl.create_list(:consumer, 3)
      get :index, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq consumer_list.to_json
    end

    it "renders package index view" do
      consumer = FactoryGirl.create(:consumer)
      fulltext = FactoryGirl.create(:fulltext)
      package = FactoryGirl.create(:package)
      consumer2 = FactoryGirl.create(:consumer)
      package.consumers_packages = [
        ConsumersPackage.new(
          { consumer_id: consumer.id, fulltext_id: fulltext.id }
        ),
        ConsumersPackage.new(
          { consumer_id: consumer2.id, fulltext_id: fulltext.id }
        )
      ]
      get :index, id: consumer.id, package_id: package.id, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq [consumer, consumer2].to_json
    end

    it "renders provider index view" do
      consumer = FactoryGirl.create(:consumer)
      fulltext = FactoryGirl.create(:fulltext)
      provider = FactoryGirl.create(:provider)
      consumer2 = FactoryGirl.create(:consumer)
      provider.consumers_providers = [
        ConsumersProvider.new(
          { consumer_id: consumer.id, fulltext_id: fulltext.id }
        ),
        ConsumersProvider.new(
          { consumer_id: consumer2.id, fulltext_id: fulltext.id }
        ),
      ]
      get :index, id: consumer.id, provider_id: provider.id, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq [consumer, consumer2].to_json
    end

  end

  describe "GET #show" do
    it "assigns the requested consumer to @consumer" do
      consumer = FactoryGirl.create(:consumer)
      get :show, id: consumer, :format => :json
      assigns(:consumer).should eq (consumer)
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq consumer.to_json
    end
  end
  
end
