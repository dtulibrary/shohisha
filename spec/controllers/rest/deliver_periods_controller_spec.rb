require 'spec_helper'

describe Rest::DeliverPeriodsController do
  render_views

  describe "GET #index" do
    # GET /rest/deliver_periods.json
    it "renders view" do
      deliver_period_list = FactoryGirl.create_list(:deliver_period, 3)
      get :index, :format => :json
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq deliver_period_list.to_json
    end

    # GET /rest/deliver_periods.html
    it "no html view" do
      get :index
      response.should_not render_template :index
    end
  end

  describe "GET #show" do
    # GET /rest/deliver_periods/1.json
    it "assigns and renders @deliver_period" do
      deliver_period = FactoryGirl.create(:deliver_period)
      get :show, id: deliver_period, :format => :json
      assigns(:deliver_period).should eq (deliver_period)
      response.header['Content-Type'].should include 'application/json'
      response.body.should eq deliver_period.to_json
    end
  end

end
