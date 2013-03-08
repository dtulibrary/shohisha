require 'spec_helper'
include Devise::TestHelpers

describe Admin::ConsumersController do
  render_views

  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  after(:each) do
    @user.destroy
  end

  describe "GET #index" do
    it "renders the :index view" do
      consumer = FactoryGirl.create(:consumer)
      get :index
      response.status.should be(200)
      response.should render_template :index
      consumer.destroy
    end
  end

  describe "GET #show" do
    it "renders the #show view" do
      consumer = FactoryGirl.create(:consumer)
      get :show, id: consumer
      response.status.should be(200)
      response.should render_template :show
      consumer.destroy
    end
  end

  describe "GET #new" do
    it "shows the new template" do
      get :new
      response.status.should be(200)
      response.should render_template :new
    end
  end

  describe "GET #edit" do
    it "shows the edit template" do
      consumer = FactoryGirl.create(:consumer)
      get :edit, id: consumer
      response.status.should be(200)
      response.should render_template :edit
      consumer.destroy
    end
  end

end
