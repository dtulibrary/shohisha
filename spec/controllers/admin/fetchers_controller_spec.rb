require 'spec_helper'
include Devise::TestHelpers

describe Admin::FetchersController do
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
      fetcher = FactoryGirl.create(:fetcher)
      get :index
      response.status.should be(200)
      response.should render_template :index
    end
  end

  describe "GET #show" do
    it "renders the #show view" do
      fetcher = FactoryGirl.create(:fetcher)
      get :show, id: fetcher
      response.status.should be(200)
      response.should render_template :show
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
      fetcher = FactoryGirl.create(:fetcher)
      get :edit, id: fetcher
      response.status.should be(200)
      response.should render_template :edit
    end
  end

  describe "PUT #update" do
    it "updates the record" do
      fetcher = FactoryGirl.create(:fetcher)
      attr = Hash.new
      Fetcher.accessible_attributes.each do |a|
        attr[a] = fetcher.send(a) unless a.blank?
      end
      put :update, :id => fetcher.id, :fetcher => attr
      fetcher.reload
      fetcher.transport_id.should eq attr['transport_id']
    end

    it "fails to update the record" do
      fetcher = FactoryGirl.create(:fetcher)
      attr = FactoryGirl.attributes_for(:fetcher)
      attr['transport_id'] = nil
      put :update, :id => fetcher.id, :fetcher => attr
      new_fetcher = Fetcher.find_by_id(fetcher.id)
      new_fetcher.transport_id.should eq fetcher.transport_id
    end
  end
end
