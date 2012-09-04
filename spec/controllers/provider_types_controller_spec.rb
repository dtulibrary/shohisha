require 'spec_helper'

describe ProviderTypesController do
  render_views

  describe "GET #index" do
    it "populates an array of provider_types" do
      #provider_type = FactoryGirl.create(:provider_type)
      #get :index
      # TODO: Should check count > 0 or something like that
      #assigns(:provider_types).should eq ([provider_type])
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested provider_type to @provider_type" do
      provider_type = FactoryGirl.create(:provider_type)
      get :show, id: provider_type
      assigns(:provider_type).should eq (provider_type)
    end

    it "renders the #show view" do
      get :show, id: FactoryGirl.create(:provider_type)
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
      get :edit, id: FactoryGirl.create(:provider_type)
      response.should render_template :edit
    end
  end

  describe "POST #create" do
    it "creates a new provider_type" do
      ProviderType.any_instance.stubs(:valid?).returns(true)
      post 'create', provider_type: FactoryGirl.attributes_for(:provider_type)
      flash[:notice].should_not be_nil
      response.should redirect_to ProviderType.last
    end

    it "fails to create a new provider_type" do
      ProviderType.any_instance.stubs(:valid?).returns(false)
      post 'create', provider_type: FactoryGirl.attributes_for(:provider_type)
      flash[:notice].should be_nil
      response.should render_template("new")
    end
  end

  describe 'PUT #update' do
    before :each do
      @provider_type = FactoryGirl.create(:provider_type, description: "Default")
    end

    it "located the requested @provider_type" do
      put :update, id: @provider_type, provider_type: FactoryGirl.attributes_for(:provider_type)
      assigns(:provider_type).should eq(@provider_type)      
    end
  
    it "changes @provider_type's attributes" do
      put :update, id: @provider_type, 
        provider_type: FactoryGirl.attributes_for(:provider_type, code: "test", description: "Test update")
      @provider_type.reload
      @provider_type.code.should eq("test")
      @provider_type.description.should eq("Test update")
      response.should redirect_to @provider_type
    end
  
    it "locates the requested @provider_type" do
      put :update, id: @provider_type, provider_type: FactoryGirl.attributes_for(:provider_type, code: nil)
      assigns(:provider_type).should eq(@provider_type)
    end
    
    it "does not change @provider_type's attributes" do
      put :update, id: @provider_type, 
        provider_type: FactoryGirl.attributes_for(
          :provider_type, code: "test", description: nil
        )
      @provider_type.reload
      @provider_type.code.should_not eq("test")
      @provider_type.description.should eq("Default")
      response.should render_template :edit
    end
  end
    
  describe 'GET #DELETE' do
    before :each do
      @provider_type = FactoryGirl.create(:provider_type)
    end
  
    it "deletes the provider_type" do
      expect{
        delete :destroy, id: @provider_type        
      }.to change(ProviderType,:count).by(-1)
    end
    
    it "redirects to provider_type#index" do
      delete :destroy, id: @provider_type
      response.should redirect_to provider_types_path
    end
  end

end
