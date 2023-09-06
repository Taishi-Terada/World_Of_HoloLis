require "test_helper"

class Admin::NewsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admin_news_create_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_news_destroy_url
    assert_response :success
  end
end
