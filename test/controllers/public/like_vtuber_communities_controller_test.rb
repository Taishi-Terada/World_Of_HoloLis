require "test_helper"

class Public::LikeVtuberCommunitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get public_like_vtuber_communities_create_url
    assert_response :success
  end

  test "should get destroy" do
    get public_like_vtuber_communities_destroy_url
    assert_response :success
  end
end
