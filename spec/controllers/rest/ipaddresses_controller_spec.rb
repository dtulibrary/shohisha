require 'spec_helper'

describe Rest::IpaddressesController do
  render_views

  describe "GET #index" do
    before :each do
      @ipaddress1 = FactoryGirl.create(:ipaddress)
      @ipaddress2 = FactoryGirl.create(:ipaddress, provider: @ipaddress1.provider)
      @ipaddress3 = FactoryGirl.create(:ipaddress)
      @ip_list = [@ipaddress1, @ipaddress2, @ipaddress3]
    end

    # GET /rest/ipaddresses.json
    it "renders view" do
      get :index, :format => :json
      expect(response.header['Content-Type']).to include 'application/json'
      expect(response.body).to eq @ip_list.to_json
    end

    # GET /rest/ipaddresses.html
    it "no html view" do
      get :index
      expect(response).not_to render_template :index
      expect(response.status).to eq 406
    end

    # GET /rest/providers/1/ipaddresses.json
    it "renders through providers" do
      get :index, provider_id: @ipaddress1.provider.id, :format => :json
      expect(response.header['Content-Type']).to include 'application/json'
      expect(response.body).to eq [@ipaddress1, @ipaddress2].to_json
    end
  end

  describe "GET #show" do
    before :each do
      @ipaddress1 = FactoryGirl.create(:ipaddress)
      @ipaddress2 = FactoryGirl.create(:ipaddress)
    end

    # GET /rest/ipaddresses/1.json
    it "assigns and renders ipaddress" do
      get :show, id: @ipaddress1, :format => :json
      expect(assigns(:ipaddress)).to eq (@ipaddress1)
      expect(response.header['Content-Type']).to include 'application/json'
      expect(response.body).to eq @ipaddress1.to_json
    end
  end
  
end
