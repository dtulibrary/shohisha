require 'spec_helper'

describe ConsumersController do
  render_views

  describe "GET #index" do
    # GET /consumers
    it "renders view" do
      consumer_list = FactoryGirl.create_list(:consumer, 3)
      get :index
      expect(response.status).to eq 200
      expect(response.header['Content-Type']).to match(/text\/html/)
    end
  end

  describe "GET #show" do
    # GET /consumers/1
    it "renders view" do
      consumer = FactoryGirl.create(:consumer)
      get :show, :id => consumer
      expect(response.status).to eq 200
      expect(response.header['Content-Type']).to match(/text\/html/)
    end
  end
end
