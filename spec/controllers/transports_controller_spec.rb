require 'spec_helper'

describe TransportsController do
  render_views

  describe "GET #index" do
    it "populates an array of transports" do
      #transport = FactoryGirl.create(:transport)
      #get :index
      # TODO: Should check count > 0 or something like that
      #assigns(:transports).should eq ([transport])
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested transport to @transport" do
      transport = FactoryGirl.create(:transport)
      get :show, id: transport
      assigns(:transport).should eq (transport)
    end

    it "renders the #show view" do
      get :show, id: FactoryGirl.create(:transport)
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
      get :edit, id: FactoryGirl.create(:transport)
      response.should render_template :edit
    end
  end

  describe "POST #create" do
    it "creates a new transport" do
      Transport.any_instance.stubs(:valid?).returns(true)
      post 'create', transport: FactoryGirl.attributes_for(:transport)
      flash[:notice].should_not be_nil
      response.should redirect_to Transport.last
    end

    it "fails to create a new transport" do
      Transport.any_instance.stubs(:valid?).returns(false)
      post 'create', transport: FactoryGirl.attributes_for(:transport)
      flash[:notice].should be_nil
      response.should render_template("new")
    end
  end

  describe 'PUT #update' do
    before :each do
      @transport = FactoryGirl.create(:transport, description: "Default")
    end

    it "located the requested @transport" do
      put :update, id: @transport, transport: FactoryGirl.attributes_for(:transport)
      assigns(:transport).should eq(@transport)      
    end
  
    it "changes @transport's attributes" do
      put :update, id: @transport, 
        transport: FactoryGirl.attributes_for(:transport, code: "test", description: "Test update")
      @transport.reload
      @transport.code.should eq("test")
      @transport.description.should eq("Test update")
      response.should redirect_to @transport
    end
  
    it "locates the requested @transport" do
      put :update, id: @transport, transport: FactoryGirl.attributes_for(:transport, code: nil)
      assigns(:transport).should eq(@transport)
    end
    
    it "does not change @transport's attributes" do
      put :update, id: @transport, 
        transport: FactoryGirl.attributes_for(
          :transport, code: "test", description: nil
        )
      @transport.reload
      @transport.code.should_not eq("test")
      @transport.description.should eq("Default")
      response.should render_template :edit
    end
  end
    
  describe 'GET #DELETE' do
    before :each do
      @transport = FactoryGirl.create(:transport)
    end
  
    it "deletes the transport" do
      expect{
        delete :destroy, id: @transport        
      }.to change(Transport,:count).by(-1)
    end
    
    it "redirects to transport#index" do
      delete :destroy, id: @transport
      response.should redirect_to transports_path
    end
  end

end
