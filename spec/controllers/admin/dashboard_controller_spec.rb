require 'spec_helper'
include Devise::TestHelpers

describe Admin::DashboardController do
  render_views

  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  after(:each) do
    @user.destroy
  end

  describe "Get dashboard" do
    it "renders the dashboard view" do
      FactoryGirl.create(:provider)
      FactoryGirl.create(:consumer)
      FactoryGirl.create(:fetcher)
      get :index
      expect(response.status).to eq(200)
      expect(response).to render_template :index
    end
  end
end
