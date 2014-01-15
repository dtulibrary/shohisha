require 'spec_helper'

describe Rest::FulltextsController do
  render_views

  describe "GET #index" do
    # GET /rest/fulltexts.json
    it "renders view" do
      fulltext_list = FactoryGirl.create_list(:fulltext, 3)
      get :index, :format => :json
      expect(response.header['Content-Type']).to include 'application/json'
      expect(response.body).to eq fulltext_list.to_json
    end

    # GET /rest/fulltexts.html
    it "no html view" do
      get :index
      expect(response).not_to render_template :index
      expect(response.status).to eq 406
    end
  end

  describe "GET #show" do
    # GET /rest/fulltexts/1.json
    it "assigns and renders @fulltext" do
      fulltext = FactoryGirl.create(:fulltext)
      fulltext2 = FactoryGirl.create(:fulltext)
      get :show, id: fulltext, :format => :json
      expect(assigns(:fulltext)).to eq (fulltext)
      expect(response.header['Content-Type']).to include 'application/json'
      expect(response.body).to eq fulltext.to_json
    end
  end
  
end
