require 'spec_helper'

describe Rest::ConsumersPackagesController do
  render_views

  before (:each) do
    @consumer = FactoryGirl.create(:consumer)
    @consumer2 = FactoryGirl.create(:consumer)
    @package = FactoryGirl.create(:package)
    @package2 = FactoryGirl.create(:package)
    fulltext = FactoryGirl.create(:fulltext)
    @consumer_package = ConsumersPackage.new(
      { package_id: @package.id, consumer_id: @consumer.id,
        fulltext_id: fulltext.id
      }
    )
    @consumer_package2 = ConsumersPackage.new(
      { package_id: @package2.id, consumer_id: @consumer2.id,
        fulltext_id: fulltext.id
      }
    )
    @package.consumers_packages = [@consumer_package]
    @package2.consumers_packages = [@consumer_package2]
  end

  describe "GET #index" do
    # GET /rest/consumerspackages.json
    it "renders view" do
      get :index, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq [@consumer_package, @consumer_package2].to_json
    end

    # GET /rest/consumers/1/consumers_packages.json
    it "renders through consumers" do
      get :index, consumer_id: @consumer, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq [@consumer_package].to_json
      get :index, consumer_id: @consumer2, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq [@consumer_package2].to_json
    end

    # GET /rest/packages/1/consumers_packages.json
    it "renders through packages" do
      get :index, package_id: @package, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq [@consumer_package].to_json
      get :index, package_id: @package2, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq [@consumer_package2].to_json
    end

    # GET /rest/consumers_packages.html
    it "no html view" do
      get :index
      response.should_not render_template :index
    end
  end

  describe "GET #show" do
    # GET /rest/consumers_packages/1.json
    it "assigns and renders @consumers_packages" do
      get :show, id: @consumer_package, :format => :json
      assigns(:consumers_packages).should eq (@consumer_package)
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq @consumer_package.to_json
    end
  end

end
