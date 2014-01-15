require 'spec_helper'

describe Rest::DeliverPeriodsController do
  render_views

  describe "GET #index" do
    # GET /rest/deliver_periods.json
    it "renders view" do
      deliver_period_list = FactoryGirl.create_list(:deliver_period, 3)
      get :index, :format => :json
      expect(response.header['Content-Type']).to include 'application/json'
      expect(response.body).to eq deliver_period_list.to_json
    end

    # GET /rest/deliver_periods.html
    it "no html view" do
      get :index
      expect(response).not_to render_template :index
      expect(response.status).to eq(406)
    end
  end

  describe "GET #show" do
    # GET /rest/deliver_periods/1.json
    it "assigns and renders @deliver_period" do
      deliver_period = FactoryGirl.create(:deliver_period)
      deliver_period2 = FactoryGirl.create(:deliver_period)
      get :show, id: deliver_period, :format => :json
      expect(assigns(:deliver_period)).to eq (deliver_period)
      expect(response.header['Content-Type']).to include 'application/json'
      expect(response.body).to eq deliver_period.to_json
    end
  end

end
