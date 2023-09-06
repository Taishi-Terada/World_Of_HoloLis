require "test_helper"

class Public::PostBookmarksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_post_bookmarks_index_url
    assert_response :success
  end

  test "should get create" do
    get public_post_bookmarks_create_url
    assert_response :success
  end

  test "should get destroy" do
    get public_post_bookmarks_destroy_url
    assert_response :success
  end
end
