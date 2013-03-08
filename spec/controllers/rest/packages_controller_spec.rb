require 'spec_helper'

describe Rest::PackagesController do
  render_views

  describe "GET #index" do
    it "renders the :index view" do
      package_list = FactoryGirl.create_list(:package, 3)
      get :index, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq package_list.to_json
    end

    it "renders providers index view" do
      package = FactoryGirl.create(:package)
      get :index, id: package.id, provider_id: package.provider.id, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq [package].to_json
    end

    it "renders consumers index view" do
      fulltext = FactoryGirl.create(:fulltext)
      consumer = FactoryGirl.create(:consumer)
      consumer2 = FactoryGirl.create(:consumer)
      package = FactoryGirl.create(:package)
      package2 = FactoryGirl.create(:package)
      consumer.consumers_packages = [
        ConsumersPackage.new(
          { package_id: package.id,
            fulltext_id: fulltext.id
          }
        ),
        ConsumersPackage.new(
          { package_id: package2.id,
            fulltext_id: fulltext.id
          }
        )
      ]
      consumer2.consumers_packages = [
        ConsumersPackage.new(
          { package_id: package.id,
            fulltext_id: fulltext.id
          }
        ),
      ]
      get :index, id: package.id, consumer_id: consumer.id, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq [package, package2].to_json
      get :index, id: package.id, consumer_id: consumer2.id, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq [package].to_json
    end
  end

  describe "GET #show" do
    it "assigns the requested package to @package" do
      package = FactoryGirl.create(:package)
      get :show, id: package, :format => :json
      assigns(:package).should eq (package)
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq package.to_json
    end
  end
  
end
