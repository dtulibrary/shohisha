require 'spec_helper'

describe Rest::PackagesController do
  render_views

  describe "GET #index" do
    # GET /rest/packages.json
    it "renders view" do
      package_list = FactoryGirl.create_list(:package, 3)
      get :index, :format => :json
      expect(response.header['Content-Type']).to include 'application/json'
      expect(response.body).to eq package_list.to_json
    end

    # GET /rest/providers/1/packages.json
    it "renders through providers" do
      package = FactoryGirl.create(:package)
      package2 = FactoryGirl.create(:package, provider_id: package.provider.id)
      package3 = FactoryGirl.create(:package)
      get :index, provider_id: package.provider, :format => :json
      expect(response.header['Content-Type']).to include 'application/json'
      expect(response.body).to eq [package, package2].to_json
      get :index, provider_id: package3.provider, :format => :json
      expect(response.header['Content-Type']).to include 'application/json'
      expect(response.body).to eq [package3].to_json
    end

    # GET /rest/consumers/1/packages.json
    it "renders through consumers" do
      fulltext = FactoryGirl.create(:fulltext)
      consumer = FactoryGirl.create(:consumer)
      consumer2 = FactoryGirl.create(:consumer)
      package = FactoryGirl.create(:package)
      package2 = FactoryGirl.create(:package)
      package3 = FactoryGirl.create(:package)
      consumer.consumers_packages = [
        ConsumersPackage.new(
          { package_id: package.id, fulltext_id: fulltext.id }
        ),
        ConsumersPackage.new(
          { package_id: package2.id, fulltext_id: fulltext.id }
        )
      ]
      consumer2.consumers_packages = [
        ConsumersPackage.new(
          { package_id: package.id, fulltext_id: fulltext.id }
        ),
        ConsumersPackage.new(
          { package_id: package3.id, fulltext_id: fulltext.id }
        )
      ]
      get :index, id: package.id, consumer_id: consumer.id, :format => :json
      expect(response.header['Content-Type']).to include 'application/json'
      expect(response.body).to eq [package, package2].to_json
      get :index, id: package.id, consumer_id: consumer2.id, :format => :json
      expect(response.header['Content-Type']).to include 'application/json'
      expect(response.body).to eq [package, package3].to_json
    end

    # GET /rest/packages.html
    it "no html view" do
      get :index
      expect(response).not_to render_template :index
      expect(response.status).to eq 406
    end
  end

  describe "GET #show" do
   # GET /package/1.json
    it "assigns and renders @package" do
      package = FactoryGirl.create(:package)
      package2 = FactoryGirl.create(:package)
      get :show, id: package, :format => :json
      expect(assigns(:package)).to eq (package)
      expect(response.header['Content-Type']).to include 'application/json'
      expect(response.body).to eq package.to_json
    end
  end
  
end
