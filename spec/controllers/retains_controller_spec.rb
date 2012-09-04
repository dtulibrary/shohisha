require 'spec_helper'

describe RetainsController do
  render_views

  describe "GET #index" do
    it "populates an array of retains" do
      #retain = FactoryGirl.create(:retain)
      #get :index
      # TODO: Should check count > 0 or something like that
      #assigns(:retains).should eq ([retain])
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested retain to @retain" do
      retain = FactoryGirl.create(:retain)
      get :show, id: retain
      assigns(:retain).should eq (retain)
    end

    it "renders the #show view" do
      get :show, id: FactoryGirl.create(:retain)
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
      get :edit, id: FactoryGirl.create(:retain)
      response.should render_template :edit
    end
  end

  describe "POST #create" do
    it "creates a new retain" do
      Retain.any_instance.stubs(:valid?).returns(true)
      post 'create', retain: FactoryGirl.attributes_for(:retain)
      flash[:notice].should_not be_nil
      response.should redirect_to Retain.last
    end

    it "fails to create a new retain" do
      Retain.any_instance.stubs(:valid?).returns(false)
      post 'create', retain: FactoryGirl.attributes_for(:retain)
      flash[:notice].should be_nil
      response.should render_template("new")
    end
  end

  describe 'PUT #update' do
    before :each do
      @retain = FactoryGirl.create(:retain, description: "Default")
    end

    it "located the requested @retain" do
      put :update, id: @retain, retain: FactoryGirl.attributes_for(:retain)
      assigns(:retain).should eq(@retain)      
    end
  
    it "changes @retain's attributes" do
      put :update, id: @retain, 
        retain: FactoryGirl.attributes_for(:retain, code: "test", description: "Test update")
      @retain.reload
      @retain.code.should eq("test")
      @retain.description.should eq("Test update")
      response.should redirect_to @retain
    end
  
    it "locates the requested @retain" do
      put :update, id: @retain, retain: FactoryGirl.attributes_for(:retain, code: nil)
      assigns(:retain).should eq(@retain)
    end
    
    it "does not change @retain's attributes" do
      put :update, id: @retain, 
        retain: FactoryGirl.attributes_for(
          :retain, code: "test", description: nil
        )
      @retain.reload
      @retain.code.should_not eq("test")
      @retain.description.should eq("Default")
      response.should render_template :edit
    end
  end
    
  describe 'GET #DELETE' do
    before :each do
      @retain = FactoryGirl.create(:retain)
    end
  
    it "deletes the retain" do
      expect{
        delete :destroy, id: @retain        
      }.to change(Retain,:count).by(-1)
    end
    
    it "redirects to retain#index" do
      delete :destroy, id: @retain
      response.should redirect_to retains_path
    end
  end

end
