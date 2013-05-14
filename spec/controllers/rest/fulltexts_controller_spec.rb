require 'spec_helper'

describe Rest::FulltextsController do
  render_views

  describe "GET #index" do
    # GET /rest/fulltexts.json
    it "renders view" do
      fulltext_list = FactoryGirl.create_list(:fulltext, 3)
      get :index, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq fulltext_list.to_json
    end

    # GET /rest/fulltexts.html
    it "no html view" do
      get :index
      response.should_not render_template :index
    end
  end

  describe "GET #show" do
    # GET /rest/fulltexts/1.json
    it "assigns and renders @fulltext" do
      fulltext = FactoryGirl.create(:fulltext)
      fulltext2 = FactoryGirl.create(:fulltext)
      get :show, id: fulltext, :format => :json
      assigns(:fulltext).should eq (fulltext)
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq fulltext.to_json
    end
  end
  
end
