require 'spec_helper'

describe Rest::FulltextsController do
  render_views

  describe "GET #index" do
    it "renders the :index view" do
      fulltext_list = FactoryGirl.create_list(:fulltext, 3)
      get :index, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq fulltext_list.to_json
    end
  end

  describe "GET #show" do
    it "assigns the requested fulltext to @fulltext" do
      fulltext = FactoryGirl.create(:fulltext)
      get :show, id: fulltext, :format => :json
      assigns(:fulltext).should eq (fulltext)
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq fulltext.to_json
    end
  end
  
end
