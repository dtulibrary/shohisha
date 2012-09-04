require 'spec_helper'

describe PackagesController do
  render_views

  describe "GET #index" do
    it "populates an array of packages" do
      #package = FactoryGirl.create(:package)
      #get :index
      # TODO: Should check count > 0 or something like that
      #assigns(:packages).should eq ([package])
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested package to @package" do
      package = FactoryGirl.create(:package)
      get :show, id: package
      assigns(:package).should eq (package)
    end

    it "renders the #show view" do
      get :show, id: FactoryGirl.create(:package)
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
      get :edit, id: FactoryGirl.create(:package)
      response.should render_template :edit
    end
  end

  describe "POST #create" do
    it "creates a new package" do
      provider = FactoryGirl.create(:provider)
      Package.any_instance.stubs(:valid?).returns(true)
      post 'create', package: FactoryGirl.attributes_for(:package, provider_id: provider.id)
      flash[:notice].should_not be_nil
      response.should redirect_to Package.last
    end

    it "fails to create a new package" do
      Package.any_instance.stubs(:valid?).returns(false)
      post 'create', package: FactoryGirl.attributes_for(:package)
      flash[:notice].should be_nil
      response.should render_template("new")
    end
  end

  describe 'PUT #update' do
    before :each do
      @package = FactoryGirl.create(:package, description: "Default")
    end

    it "located the requested @package" do
      put :update, id: @package, package: FactoryGirl.attributes_for(:package)
      assigns(:package).should eq(@package)      
    end
  
    it "changes @package's attributes" do
      put :update, id: @package, 
        package: FactoryGirl.attributes_for(:package, code: "test", description: "Test update")
      @package.reload
      @package.code.should eq("test")
      @package.description.should eq("Test update")
      response.should redirect_to @package
    end
  
    it "locates the requested @package" do
      put :update, id: @package, package: FactoryGirl.attributes_for(:package, code: nil)
      assigns(:package).should eq(@package)
    end
    
    it "does not change @package's attributes" do
      put :update, id: @package, 
        package: FactoryGirl.attributes_for(
          :package, code: "test", description: nil
        )
      @package.reload
      @package.code.should_not eq("test")
      @package.description.should eq("Default")
      response.should render_template :edit
    end
  end
    
  describe 'GET #DELETE' do
    before :each do
      @package = FactoryGirl.create(:package)
    end
  
    it "deletes the package" do
      expect{
        delete :destroy, id: @package        
      }.to change(Package,:count).by(-1)
    end
    
    it "redirects to package#index" do
      delete :destroy, id: @package
      response.should redirect_to packages_path
    end
  end

  describe "accepts nested consumer package attributes" do
    #it "creates a consumer package relationship" do
    #  @provider = FactoryGirl.create(:provider)
    #  @consumer = FactoryGirl.create(:consumer)
    #  Package.any_instance.stubs(:valid?).returns(true)
    #  post 'create', 
    #    package: FactoryGirl.attributes_for(:package, provider_id: @provider.id),
    #    consumers_package: { consumer_id: @consumer.id }
    #  flash[:notice].should_not be_nil
    #  # TODO: Test for consumer package relationship
    #  @consumer.packages.size.should eq 1
    #  response.should redirect_to Package.last
    #end

    #it "deletes a consumer package relationship" do
      # TODO: Delete the relation created in previous example
      # Update with destroy attribute
      #@consumer.packages.size.should eq 0
    #end
  end

end
