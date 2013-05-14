require 'spec_helper'

describe Rest::UsersController do
  render_views

  describe "GET #index" do
    # GET /rest/users.json
    it "renders view" do
      user_list = FactoryGirl.create_list(:user, 3)
      get :index, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq user_list.to_json
    end

    # GET /rest/users.html
    it "no html view" do
      get :index
      response.should_not render_template :index
    end
  end

  describe "GET #show" do
    # GET /rest/users/1.json
    it "assigns and renders @user" do
      user = FactoryGirl.create(:user)
      user2 = FactoryGirl.create(:user)
      get :show, id: user, :format => :json
      assigns(:user).should eq (user)
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq user.to_json
    end
  end
  
end
