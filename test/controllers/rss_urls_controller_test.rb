require 'test_helper'

class RssUrlsControllerTest < ActionController::TestCase
  setup do
    @rss_url = rss_urls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rss_urls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rss_url" do
    assert_difference('RssUrl.count') do
      post :create, rss_url: { url: @rss_url.url }
    end

    assert_redirected_to rss_url_path(assigns(:rss_url))
  end

  test "should show rss_url" do
    get :show, id: @rss_url
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rss_url
    assert_response :success
  end

  test "should update rss_url" do
    patch :update, id: @rss_url, rss_url: { url: @rss_url.url }
    assert_redirected_to rss_url_path(assigns(:rss_url))
  end

  test "should destroy rss_url" do
    assert_difference('RssUrl.count', -1) do
      delete :destroy, id: @rss_url
    end

    assert_redirected_to rss_urls_path
  end
end
