require 'spec_helper'

describe FetchersController do
  render_views

  describe "GET #index" do
    it "populates an array of fetchers" do
      #fetcher = FactoryGirl.create(:fetcher)
      #get :index
      # TODO: Should check count > 0 or something like that
      #assigns(:fetchers).should eq ([fetcher])
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested fetcher to @fetcher" do
      fetcher = FactoryGirl.create(:fetcher)
      get :show, id: fetcher
      assigns(:fetcher).should eq (fetcher)
    end

    it "renders the #show view" do
      get :show, id: FactoryGirl.create(:fetcher)
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
      get :edit, id: FactoryGirl.create(:fetcher)
      response.should render_template :edit
    end
  end

  describe "POST #create" do
    it "creates a new fetcher" do
      provider = FactoryGirl.create(:provider)
      status = FactoryGirl.create(:status)
      transport = FactoryGirl.create(:transport)
      retain = FactoryGirl.create(:retain)
      deliver_period = FactoryGirl.create(:deliver_period)
      Fetcher.any_instance.stubs(:valid?).returns(true)
      post 'create', fetcher: FactoryGirl.attributes_for(:fetcher, 
        provider_id: provider.id, status_id: status.id,
        transport_id: transport.id, retain_id: retain.id,
        deliver_period_id: deliver_period.id)
      flash[:notice].should_not be_nil
      response.should redirect_to Fetcher.last
    end

    it "fails to create a new fetcher" do
      Fetcher.any_instance.stubs(:valid?).returns(false)
      post 'create', fetcher: FactoryGirl.attributes_for(:fetcher)
      flash[:notice].should be_nil
      response.should render_template("new")
    end
  end

  describe 'PUT #update' do
    before :each do
      @fetcher = FactoryGirl.create(:fetcher, basename: "Default")
    end

    it "located the requested @fetcher" do
      put :update, id: @fetcher, fetcher: FactoryGirl.attributes_for(:fetcher)
      assigns(:fetcher).should eq(@fetcher)      
    end
  
    it "changes @fetcher's attributes" do
      put :update, id: @fetcher, 
        fetcher: FactoryGirl.attributes_for(:fetcher, basename: "Test update")
      @fetcher.reload
      @fetcher.basename.should eq("Test update")
      response.should redirect_to @fetcher
    end
  
    it "locates the requested @fetcher" do
      put :update, id: @fetcher, fetcher: FactoryGirl.attributes_for(:fetcher, provider_id: nil)
      assigns(:fetcher).should eq(@fetcher)
    end
    
    it "does not change @fetcher's attributes" do
      put :update, id: @fetcher, 
        fetcher: FactoryGirl.attributes_for(
          :fetcher, provider_id: nil, basename: nil
        )
      @fetcher.reload
      @fetcher.basename.should eq("Default")
      response.should render_template :edit
    end
  end
    
  describe 'GET #DELETE' do
    before :each do
      @fetcher = FactoryGirl.create(:fetcher)
    end
  
    it "deletes the fetcher" do
      expect{
        delete :destroy, id: @fetcher        
      }.to change(Fetcher,:count).by(-1)
    end
    
    it "redirects to fetcher#index" do
      delete :destroy, id: @fetcher
      response.should redirect_to fetchers_path
    end
  end

end
