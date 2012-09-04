require 'spec_helper'

describe FulltextsController do
  render_views

  describe "GET #index" do
    it "populates an array of fulltexts" do
      #fulltext = FactoryGirl.create(:fulltext)
      #get :index
      # TODO: Should check count > 0 or something like that
      #assigns(:fulltexts).should eq ([fulltext])
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested fulltext to @fulltext" do
      fulltext = FactoryGirl.create(:fulltext)
      get :show, id: fulltext
      assigns(:fulltext).should eq (fulltext)
    end

    it "renders the #show view" do
      get :show, id: FactoryGirl.create(:fulltext)
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
      get :edit, id: FactoryGirl.create(:fulltext)
      response.should render_template :edit
    end
  end

  describe "POST #create" do
    it "creates a new fulltext" do
      Fulltext.any_instance.stubs(:valid?).returns(true)
      post 'create', fulltext: FactoryGirl.attributes_for(:fulltext)
      flash[:notice].should_not be_nil
      response.should redirect_to Fulltext.last
    end

    it "fails to create a new fulltext" do
      Fulltext.any_instance.stubs(:valid?).returns(false)
      post 'create', fulltext: FactoryGirl.attributes_for(:fulltext)
      flash[:notice].should be_nil
      response.should render_template("new")
    end
  end

  describe 'PUT #update' do
    before :each do
      @fulltext = FactoryGirl.create(:fulltext, description: "Default")
    end

    it "located the requested @fulltext" do
      put :update, id: @fulltext, fulltext: FactoryGirl.attributes_for(:fulltext)
      assigns(:fulltext).should eq(@fulltext)      
    end
  
    it "changes @fulltext's attributes" do
      put :update, id: @fulltext, 
        fulltext: FactoryGirl.attributes_for(:fulltext, code: "test", description: "Test update")
      @fulltext.reload
      @fulltext.code.should eq("test")
      @fulltext.description.should eq("Test update")
      response.should redirect_to @fulltext
    end
  
    it "locates the requested @fulltext" do
      put :update, id: @fulltext, fulltext: FactoryGirl.attributes_for(:fulltext, code: nil)
      assigns(:fulltext).should eq(@fulltext)
    end
    
    it "does not change @fulltext's attributes" do
      put :update, id: @fulltext, 
        fulltext: FactoryGirl.attributes_for(
          :fulltext, code: "test", description: nil
        )
      @fulltext.reload
      @fulltext.code.should_not eq("test")
      @fulltext.description.should eq("Default")
      response.should render_template :edit
    end
  end
    
  describe 'GET #DELETE' do
    before :each do
      @fulltext = FactoryGirl.create(:fulltext)
    end
  
    it "deletes the fulltext" do
      expect{
        delete :destroy, id: @fulltext        
      }.to change(Fulltext,:count).by(-1)
    end
    
    it "redirects to fulltext#index" do
      delete :destroy, id: @fulltext
      response.should redirect_to fulltexts_path
    end
  end

end
