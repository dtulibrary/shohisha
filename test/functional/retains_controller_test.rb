require 'test_helper'

class RetainsControllerTest < ActionController::TestCase
  setup do
    @retain = retains(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:retains)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create retain" do
    assert_difference('Retain.count') do
      post :create, :retain => { :code => @retain.code, :description => @retain.description }
    end

    assert_redirected_to retain_path(assigns(:retain))
  end

  test "should show retain" do
    get :show, :id => @retain
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @retain
    assert_response :success
  end

  test "should update retain" do
    put :update, :id => @retain, :retain => { :code => @retain.code, :description => @retain.description }
    assert_redirected_to retain_path(assigns(:retain))
  end

  test "should destroy retain" do
    assert_difference('Retain.count', -1) do
      delete :destroy, :id => @retain
    end

    assert_redirected_to retains_path
  end
end
