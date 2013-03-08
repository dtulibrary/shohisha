require 'spec_helper'

describe Rest::ConsumersPackagesController do
  render_views

  before (:each) do
    @consumer = FactoryGirl.create(:consumer)
    @package = FactoryGirl.create(:package)
    fulltext = FactoryGirl.create(:fulltext)
    @consumer_package = ConsumersPackage.new(
      { package_id: @package.id, consumer_id: @consumer.id,
        fulltext_id: fulltext.id
      }
    )
    @package.consumers_packages = [@consumer_package]
  end

  describe "GET #index" do
    it "renders the :index view" do
      get :index, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq [@consumer_package].to_json
    end

    it "renders the consumer :index view" do
      get :index, consumer_id: @consumer, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq [@consumer_package].to_json
    end

    it "renders the package :index view" do
      get :index, package_id: @package, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq [@consumer_package].to_json
    end
  end

  describe "GET #show" do
    it "assigns @consumers_packages through consumer" do
      get :show, id: @consumer_package, consumer_id: @consumer, :format => :json
      assigns(:consumers_packages).should eq (@consumer_package)
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq @consumer_package.to_json
    end

    it "assigns @consumers_packages through provider" do
      get :show, id: @consumer_package, provider_id: @provider, :format => :json
      assigns(:consumers_packages).should eq (@consumer_package)
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq @consumer_package.to_json
    end
  end


end
