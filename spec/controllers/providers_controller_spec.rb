require 'spec_helper'

describe ProvidersController do
  render_views

  describe "GET #index" do
    it "populates an array of providers" do
      #provider = FactoryGirl.create(:provider)
      #get :index
      # TODO: Should check count > 0 or something like that
      #assigns(:providers).should eq ([provider])
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested provider to @provider" do
      provider = FactoryGirl.create(:provider)
      get :show, id: provider
      assigns(:provider).should eq (provider)
    end

    it "renders the #show view" do
      get :show, id: FactoryGirl.create(:provider)
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
      get :edit, id: FactoryGirl.create(:provider)
      response.should render_template :edit
    end
  end

  describe "POST #create" do
    it "creates a new provider" do
      Provider.any_instance.stubs(:valid?).returns(true)
      post 'create', provider: FactoryGirl.attributes_for(:provider)
      flash[:notice].should_not be_nil
      response.should redirect_to Provider.last
    end

    it "fails to create a new provider" do
      Provider.any_instance.stubs(:valid?).returns(false)
      post 'create', provider: FactoryGirl.attributes_for(:provider)
      flash[:notice].should be_nil
      response.should render_template("new")
    end
  end

  describe 'PUT #update' do
    before :each do
      @provider = FactoryGirl.create(:provider, description: "Default")
    end

    it "located the requested @provider" do
      put :update, id: @provider, provider: FactoryGirl.attributes_for(:provider)
      assigns(:provider).should eq(@provider)      
    end
  
    it "changes @provider's attributes" do
      put :update, id: @provider, 
        provider: FactoryGirl.attributes_for(:provider, code: "test", description: "Test update")
      @provider.reload
      @provider.code.should eq("test")
      @provider.description.should eq("Test update")
      response.should redirect_to @provider
    end
  
    it "locates the requested @provider" do
      put :update, id: @provider, provider: FactoryGirl.attributes_for(:provider, code: nil)
      assigns(:provider).should eq(@provider)
    end
    
    it "does not change @provider's attributes" do
      put :update, id: @provider, 
        provider: FactoryGirl.attributes_for(
          :provider, code: "test", description: nil
        )
      @provider.reload
      @provider.code.should_not eq("test")
      @provider.description.should eq("Default")
      response.should render_template :edit
    end
  end
    
  describe 'GET #DELETE' do
    before :each do
      @provider = FactoryGirl.create(:provider)
    end
  
    it "deletes the provider" do
      expect{
        delete :destroy, id: @provider        
      }.to change(Provider,:count).by(-1)
    end
    
    it "redirects to provider#index" do
      delete :destroy, id: @provider
      response.should redirect_to providers_path
    end
  end

end
