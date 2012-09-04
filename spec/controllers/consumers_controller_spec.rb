require 'spec_helper'

describe ConsumersController do
  render_views

  describe "GET #index" do
    it "populates an array of consumers" do
      #consumer = FactoryGirl.create(:consumer)
      #get :index
      # TODO: Should check count > 0 or something like that
      #assigns(:consumers).should eq ([consumer])
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested consumer to @consumer" do
      consumer = FactoryGirl.create(:consumer)
      get :show, id: consumer
      assigns(:consumer).should eq (consumer)
    end

    it "renders the #show view" do
      get :show, id: FactoryGirl.create(:consumer)
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
      get :edit, id: FactoryGirl.create(:consumer)
      response.should render_template :edit
    end
  end

  describe "POST #create" do
    it "creates a new consumer" do
      Consumer.any_instance.stubs(:valid?).returns(true)
      post 'create', consumer: FactoryGirl.attributes_for(:consumer)
      flash[:notice].should_not be_nil
      response.should redirect_to Consumer.last
    end

    it "fails to create a new consumer" do
      Consumer.any_instance.stubs(:valid?).returns(false)
      post 'create', consumer: FactoryGirl.attributes_for(:consumer)
      flash[:notice].should be_nil
      response.should render_template("new")
    end
  end

  describe 'PUT #update' do
    before :each do
      @consumer = FactoryGirl.create(:consumer, description: "Default")
    end

    it "located the requested @consumer" do
      put :update, id: @consumer, consumer: FactoryGirl.attributes_for(:consumer)
      assigns(:consumer).should eq(@consumer)      
    end
  
    it "changes @consumer's attributes" do
      put :update, id: @consumer, 
        consumer: FactoryGirl.attributes_for(:consumer, code: "test", description: "Test update")
      @consumer.reload
      @consumer.code.should eq("test")
      @consumer.description.should eq("Test update")
      response.should redirect_to @consumer
    end
  
    it "locates the requested @consumer" do
      put :update, id: @consumer, consumer: FactoryGirl.attributes_for(:consumer, code: nil)
      assigns(:consumer).should eq(@consumer)
    end
    
    it "does not change @consumer's attributes" do
      put :update, id: @consumer, 
        consumer: FactoryGirl.attributes_for(
          :consumer, code: "test", description: nil
        )
      @consumer.reload
      @consumer.code.should_not eq("test")
      @consumer.description.should eq("Default")
      response.should render_template :edit
    end
  end
    
  describe 'GET #DELETE' do
    before :each do
      @consumer = FactoryGirl.create(:consumer)
    end
  
    it "deletes the consumer" do
      expect{
        delete :destroy, id: @consumer        
      }.to change(Consumer,:count).by(-1)
    end
    
    it "redirects to consumer#index" do
      delete :destroy, id: @consumer
      response.should redirect_to consumers_path
    end
  end

end
