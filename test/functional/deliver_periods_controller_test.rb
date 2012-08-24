require 'test_helper'

class DeliverPeriodsControllerTest < ActionController::TestCase
  setup do
    @deliver_period = deliver_periods(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:deliver_periods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create deliver_period" do
    assert_difference('DeliverPeriod.count') do
      post :create, :deliver_period => { :code => @deliver_period.code, :description => @deliver_period.description }
    end

    assert_redirected_to deliver_period_path(assigns(:deliver_period))
  end

  test "should show deliver_period" do
    get :show, :id => @deliver_period
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @deliver_period
    assert_response :success
  end

  test "should update deliver_period" do
    put :update, :id => @deliver_period, :deliver_period => { :code => @deliver_period.code, :description => @deliver_period.description }
    assert_redirected_to deliver_period_path(assigns(:deliver_period))
  end

  test "should destroy deliver_period" do
    assert_difference('DeliverPeriod.count', -1) do
      delete :destroy, :id => @deliver_period
    end

    assert_redirected_to deliver_periods_path
  end
end
