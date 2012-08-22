require 'test_helper'

class FulltextsControllerTest < ActionController::TestCase
  setup do
    @fulltext = fulltexts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fulltexts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fulltext" do
    assert_difference('Fulltext.count') do
      post :create, :fulltext => { :code => @fulltext.code, :description => @fulltext.description }
    end

    assert_redirected_to fulltext_path(assigns(:fulltext))
  end

  test "should show fulltext" do
    get :show, :id => @fulltext
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @fulltext
    assert_response :success
  end

  test "should update fulltext" do
    put :update, :id => @fulltext, :fulltext => { :code => @fulltext.code, :description => @fulltext.description }
    assert_redirected_to fulltext_path(assigns(:fulltext))
  end

  test "should destroy fulltext" do
    assert_difference('Fulltext.count', -1) do
      delete :destroy, :id => @fulltext
    end

    assert_redirected_to fulltexts_path
  end
end
