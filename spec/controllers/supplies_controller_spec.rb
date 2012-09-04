require 'spec_helper'

describe SuppliesController do
  render_views

  describe "GET #index" do
    it "populates an array of supplies" do
      #supply = FactoryGirl.create(:supply)
      #get :index
      # TODO: Should check count > 0 or something like that
      #assigns(:supplies).should eq ([supply])
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested supply to @supply" do
      supply = FactoryGirl.create(:supply)
      get :show, id: supply
      assigns(:supply).should eq (supply)
    end

    it "renders the #show view" do
      get :show, id: FactoryGirl.create(:supply)
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
      get :edit, id: FactoryGirl.create(:supply)
      response.should render_template :edit
    end
  end

  describe "POST #create" do
    it "creates a new supply" do
      Supply.any_instance.stubs(:valid?).returns(true)
      post 'create', supply: FactoryGirl.attributes_for(:supply)
      flash[:notice].should_not be_nil
      response.should redirect_to Supply.last
    end

    it "fails to create a new supply" do
      Supply.any_instance.stubs(:valid?).returns(false)
      post 'create', supply: FactoryGirl.attributes_for(:supply)
      flash[:notice].should be_nil
      response.should render_template("new")
    end
  end

  describe 'PUT #update' do
    before :each do
      @supply = FactoryGirl.create(:supply, description: "Default")
    end

    it "located the requested @supply" do
      put :update, id: @supply, supply: FactoryGirl.attributes_for(:supply)
      assigns(:supply).should eq(@supply)      
    end
  
    it "changes @supply's attributes" do
      put :update, id: @supply, 
        supply: FactoryGirl.attributes_for(:supply, code: "test", description: "Test update")
      @supply.reload
      @supply.code.should eq("test")
      @supply.description.should eq("Test update")
      response.should redirect_to @supply
    end
  
    it "locates the requested @supply" do
      put :update, id: @supply, supply: FactoryGirl.attributes_for(:supply, code: nil)
      assigns(:supply).should eq(@supply)
    end
    
    it "does not change @supply's attributes" do
      put :update, id: @supply, 
        supply: FactoryGirl.attributes_for(
          :supply, code: "test", description: nil
        )
      @supply.reload
      @supply.code.should_not eq("test")
      @supply.description.should eq("Default")
      response.should render_template :edit
    end
  end
    
  describe 'GET #DELETE' do
    before :each do
      @supply = FactoryGirl.create(:supply)
    end
  
    it "deletes the supply" do
      expect{
        delete :destroy, id: @supply        
      }.to change(Supply,:count).by(-1)
    end
    
    it "redirects to supply#index" do
      delete :destroy, id: @supply
      response.should redirect_to supplies_path
    end
  end

end
