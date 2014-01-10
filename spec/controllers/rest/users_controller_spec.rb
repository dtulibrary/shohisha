require 'spec_helper'

describe Rest::UsersController do
  render_views

  describe "GET #index" do
    # GET /rest/users.json
    it "renders view" do
      user_list = FactoryGirl.create_list(:user, 3)
      get :index, :format => :json
      expect(response.header['Content-Type']).to include 'application/json'
      expect(response.body).to eq user_list.to_json
    end

    # GET /rest/users.html
    it "no html view" do
      get :index
      expect(response).not_to render_template :index
      expect(response.status).to eq 406
    end
  end

  describe "GET #show" do
    # GET /rest/users/1.json
    it "assigns and renders @user" do
      user = FactoryGirl.create(:user)
      user2 = FactoryGirl.create(:user)
      get :show, id: user, :format => :json
      expect(assigns(:user)).to eq (user)
      expect(response.header['Content-Type']).to include 'application/json'
      expect(response.body).to eq user.to_json
    end
  end
  
end
