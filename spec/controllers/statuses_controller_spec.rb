require 'spec_helper'

describe StatusesController do
  render_views

  describe "GET #index" do
    it "populates an array of statuses" do
      #status = FactoryGirl.create(:status)
      #get :index
      # TODO: Should check count > 0 or something like that
      #assigns(:statuses).should eq ([status])
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested status to @status" do
      status = FactoryGirl.create(:status)
      get :show, id: status
      assigns(:status).should eq (status)
    end

    it "renders the #show view" do
      get :show, id: FactoryGirl.create(:status)
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
      get :edit, id: FactoryGirl.create(:status)
      response.should render_template :edit
    end
  end

  describe "POST #create" do
    it "creates a new status" do
      Status.any_instance.stubs(:valid?).returns(true)
      post 'create', status: FactoryGirl.attributes_for(:status)
      flash[:notice].should_not be_nil
      response.should redirect_to Status.last
    end

    it "fails to create a new status" do
      Status.any_instance.stubs(:valid?).returns(false)
      post 'create', status: FactoryGirl.attributes_for(:status)
      flash[:notice].should be_nil
      response.should render_template("new")
    end
  end

  describe 'PUT #update' do
    before :each do
      @status = FactoryGirl.create(:status, description: "Default")
    end

    it "located the requested @status" do
      put :update, id: @status, status: FactoryGirl.attributes_for(:status)
      assigns(:status).should eq(@status)      
    end
  
    it "changes @status's attributes" do
      put :update, id: @status, 
        status: FactoryGirl.attributes_for(:status, code: "test", description: "Test update")
      @status.reload
      @status.code.should eq("test")
      @status.description.should eq("Test update")
      response.should redirect_to @status
    end
  
    it "locates the requested @status" do
      put :update, id: @status, status: FactoryGirl.attributes_for(:status, code: nil)
      assigns(:status).should eq(@status)
    end
    
    it "does not change @status's attributes" do
      put :update, id: @status, 
        status: FactoryGirl.attributes_for(
          :status, code: "test", description: nil
        )
      @status.reload
      @status.code.should_not eq("test")
      @status.description.should eq("Default")
      response.should render_template :edit
    end
  end
    
  describe 'GET #DELETE' do
    before :each do
      @status = FactoryGirl.create(:status)
    end
  
    it "deletes the status" do
      expect{
        delete :destroy, id: @status        
      }.to change(Status,:count).by(-1)
    end
    
    it "redirects to status#index" do
      delete :destroy, id: @status
      response.should redirect_to statuses_path
    end
  end

end
