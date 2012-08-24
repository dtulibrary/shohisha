require 'test_helper'

class FetchersControllerTest < ActionController::TestCase
  setup do
    @fetcher = fetchers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fetchers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fetcher" do
    assert_difference('Fetcher.count') do
      post :create, :fetcher => { :basename => @fetcher.basename, :charset => @fetcher.charset, :directory => @fetcher.directory, :directory_filter => @fetcher.directory_filter, :file_filter => @fetcher.file_filter, :format => @fetcher.format, :passive => @fetcher.passive, :password => @fetcher.password, :recursive => @fetcher.recursive, :remote_delete => @fetcher.remote_delete, :seperator => @fetcher.seperator, :set => @fetcher.set, :set_limit => @fetcher.set_limit, :timeout => @fetcher.timeout, :username => @fetcher.username }
    end

    assert_redirected_to fetcher_path(assigns(:fetcher))
  end

  test "should show fetcher" do
    get :show, :id => @fetcher
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @fetcher
    assert_response :success
  end

  test "should update fetcher" do
    put :update, :id => @fetcher, :fetcher => { :basename => @fetcher.basename, :charset => @fetcher.charset, :directory => @fetcher.directory, :directory_filter => @fetcher.directory_filter, :file_filter => @fetcher.file_filter, :format => @fetcher.format, :passive => @fetcher.passive, :password => @fetcher.password, :recursive => @fetcher.recursive, :remote_delete => @fetcher.remote_delete, :seperator => @fetcher.seperator, :set => @fetcher.set, :set_limit => @fetcher.set_limit, :timeout => @fetcher.timeout, :username => @fetcher.username }
    assert_redirected_to fetcher_path(assigns(:fetcher))
  end

  test "should destroy fetcher" do
    assert_difference('Fetcher.count', -1) do
      delete :destroy, :id => @fetcher
    end

    assert_redirected_to fetchers_path
  end
end
