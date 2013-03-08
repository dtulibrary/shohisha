require 'spec_helper'

describe Rest::UsersController do
  render_views

  describe "GET #index" do
    it "renders the :index view" do
      user_list = FactoryGirl.create_list(:user, 3)
      get :index, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq user_list.to_json
    end
  end

  describe "GET #show" do
    it "assigns the requested user to @user" do
      user = FactoryGirl.create(:user)
      get :show, id: user, :format => :json
      assigns(:user).should eq (user)
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq user.to_json
    end
  end
  
end
