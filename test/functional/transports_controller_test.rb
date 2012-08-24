require 'test_helper'

class TransportsControllerTest < ActionController::TestCase
  setup do
    @transport = transports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transport" do
    assert_difference('Transport.count') do
      post :create, :transport => { :code => @transport.code, :description => @transport.description }
    end

    assert_redirected_to transport_path(assigns(:transport))
  end

  test "should show transport" do
    get :show, :id => @transport
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @transport
    assert_response :success
  end

  test "should update transport" do
    put :update, :id => @transport, :transport => { :code => @transport.code, :description => @transport.description }
    assert_redirected_to transport_path(assigns(:transport))
  end

  test "should destroy transport" do
    assert_difference('Transport.count', -1) do
      delete :destroy, :id => @transport
    end

    assert_redirected_to transports_path
  end
end
