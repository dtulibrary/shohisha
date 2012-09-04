require 'spec_helper'

describe IpaddressesController do
  render_views

  describe "GET #index" do
    it "populates an array of ipaddresses" do
      #ipaddress = FactoryGirl.create(:ipaddress)
      #get :index
      # TODO: Should check count > 0 or something like that
      #assigns(:ipaddresses).should eq ([ipaddress])
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested ipaddress to @ipaddress" do
      ipaddress = FactoryGirl.create(:ipaddress)
      get :show, id: ipaddress
      assigns(:ipaddress).should eq (ipaddress)
    end

    it "renders the #show view" do
      get :show, id: FactoryGirl.create(:ipaddress)
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
      get :edit, id: FactoryGirl.create(:ipaddress)
      response.should render_template :edit
    end
  end

  describe "POST #create" do
    it "creates a new ipaddress" do
      provider = FactoryGirl.create(:provider)
      Ipaddress.any_instance.stubs(:valid?).returns(true)
      post 'create', ipaddress: FactoryGirl.attributes_for(:ipaddress, provider_id: provider.id)
      flash[:notice].should_not be_nil
      response.should redirect_to Ipaddress.last
    end

    it "fails to create a new ipaddress" do
      Ipaddress.any_instance.stubs(:valid?).returns(false)
      post 'create', ipaddress: FactoryGirl.attributes_for(:ipaddress)
      flash[:notice].should be_nil
      response.should render_template("new")
    end
  end

  describe 'PUT #update' do
    before :each do
      @ipaddress = FactoryGirl.create(:ipaddress, address: "Default")
    end

    it "located the requested @ipaddress" do
      put :update, id: @ipaddress, ipaddress: FactoryGirl.attributes_for(:ipaddress)
      assigns(:ipaddress).should eq(@ipaddress)      
    end
  
    it "changes @ipaddress's attributes" do
      put :update, id: @ipaddress, 
        ipaddress: FactoryGirl.attributes_for(:ipaddress, address: "Test update")
      @ipaddress.reload
      @ipaddress.address.should eq("Test update")
      response.should redirect_to @ipaddress
    end
  
    it "locates the requested @ipaddress" do
      put :update, id: @ipaddress, ipaddress: FactoryGirl.attributes_for(:ipaddress, address: nil)
      assigns(:ipaddress).should eq(@ipaddress)
    end
    
    it "does not change @ipaddress's attributes" do
      put :update, id: @ipaddress, 
        ipaddress: FactoryGirl.attributes_for(
          :ipaddress, address: nil
        )
      @ipaddress.reload
      @ipaddress.address.should eq("Default")
      response.should render_template :edit
    end
  end
    
  describe 'GET #DELETE' do
    before :each do
      @ipaddress = FactoryGirl.create(:ipaddress)
    end
  
    it "deletes the ipaddress" do
      expect{
        delete :destroy, id: @ipaddress        
      }.to change(Ipaddress,:count).by(-1)
    end
    
    it "redirects to ipaddress#index" do
      delete :destroy, id: @ipaddress
      response.should redirect_to ipaddresses_path
    end
  end

end
