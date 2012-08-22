require 'test_helper'

class ConsumersProvidersControllerTest < ActionController::TestCase
  setup do
    @consumers_provider = consumers_providers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:consumers_providers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create consumers_provider" do
    assert_difference('ConsumersProvider.count') do
      post :create, :consumers_provider => {  }
    end

    assert_redirected_to consumers_provider_path(assigns(:consumers_provider))
  end

  test "should show consumers_provider" do
    get :show, :id => @consumers_provider
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @consumers_provider
    assert_response :success
  end

  test "should update consumers_provider" do
    put :update, :id => @consumers_provider, :consumers_provider => {  }
    assert_redirected_to consumers_provider_path(assigns(:consumers_provider))
  end

  test "should destroy consumers_provider" do
    assert_difference('ConsumersProvider.count', -1) do
      delete :destroy, :id => @consumers_provider
    end

    assert_redirected_to consumers_providers_path
  end
end
