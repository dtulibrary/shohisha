require 'spec_helper'

describe DeliverPeriodsController do
  render_views

  describe "GET #index" do
    it "populates an array of deliver_periods" do
      #deliver_period = FactoryGirl.create(:deliver_period)
      #get :index
      # TODO: Should check count > 0 or something like that
      #assigns(:deliver_periods).should eq ([deliver_period])
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested deliver_period to @deliver_period" do
      deliver_period = FactoryGirl.create(:deliver_period)
      get :show, id: deliver_period
      assigns(:deliver_period).should eq (deliver_period)
    end

    it "renders the #show view" do
      get :show, id: FactoryGirl.create(:deliver_period)
      response.should render_template :show
    end
  end
  
  describe "GET #new" do
    it "shows the new template" do
      get :new
      response.should render_template :new
    end
  end

  describe "GET #edit" do
    it "shows the edit template" do
      get :edit, id: FactoryGirl.create(:deliver_period)
      response.should render_template :edit
    end
  end

  describe "POST #create" do
    it "creates a new deliver_period" do
      DeliverPeriod.any_instance.stubs(:valid?).returns(true)
      post 'create', deliver_period: FactoryGirl.attributes_for(:deliver_period)
      flash[:notice].should_not be_nil
      response.should redirect_to DeliverPeriod.last
    end

    it "fails to create a new deliver_period" do
      DeliverPeriod.any_instance.stubs(:valid?).returns(false)
      post 'create', deliver_period: FactoryGirl.attributes_for(:deliver_period)
      flash[:notice].should be_nil
      response.should render_template("new")
    end
  end

  describe 'PUT #update' do
    before :each do
      @deliver_period = FactoryGirl.create(:deliver_period, description: "Default")
    end

    it "located the requested @deliver_period" do
      put :update, id: @deliver_period, deliver_period: FactoryGirl.attributes_for(:deliver_period)
      assigns(:deliver_period).should eq(@deliver_period)      
    end
  
    it "changes @deliver_period's attributes" do
      put :update, id: @deliver_period, 
        deliver_period: FactoryGirl.attributes_for(:deliver_period, code: "test", description: "Test update")
      @deliver_period.reload
      @deliver_period.code.should eq("test")
      @deliver_period.description.should eq("Test update")
      response.should redirect_to @deliver_period
    end
  
    it "locates the requested @deliver_period" do
      put :update, id: @deliver_period, deliver_period: FactoryGirl.attributes_for(:deliver_period, code: nil)
      assigns(:deliver_period).should eq(@deliver_period)
    end
    
    it "does not change @deliver_period's attributes" do
      put :update, id: @deliver_period, 
        deliver_period: FactoryGirl.attributes_for(
          :deliver_period, code: "test", description: nil
        )
      @deliver_period.reload
      @deliver_period.code.should_not eq("test")
      @deliver_period.description.should eq("Default")
      response.should render_template :edit
    end
  end
    
  describe 'GET #DELETE' do
    before :each do
      @deliver_period = FactoryGirl.create(:deliver_period)
    end
  
    it "deletes the deliver_period" do
      expect{
        delete :destroy, id: @deliver_period        
      }.to change(DeliverPeriod,:count).by(-1)
    end
    
    it "redirects to deliver_period#index" do
      delete :destroy, id: @deliver_period
      response.should redirect_to deliver_periods_path
    end
  end

end
