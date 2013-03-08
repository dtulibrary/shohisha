require 'spec_helper'

describe Rest::DeliverPeriodsController do
  render_views

  describe "GET #index" do
    it "renders the :index view" do
      deliver_period_list = FactoryGirl.create_list(:deliver_period, 3)
      get :index, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq deliver_period_list.to_json
    end

    it "no html :index view" do
      get :index
      response.should_not render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested deliver_period to @deliver_period" do
      deliver_period = FactoryGirl.create(:deliver_period)
      get :show, id: deliver_period, :format => :json
      assigns(:deliver_period).should eq (deliver_period)
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq deliver_period.to_json
    end
  end

end
