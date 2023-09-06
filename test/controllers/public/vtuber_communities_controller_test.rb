require "test_helper"

class Public::VtuberCommunitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_vtuber_communities_index_url
    assert_response :success
  end

  test "should get show" do
    get public_vtuber_communities_show_url
    assert_response :success
  end

  test "should get search" do
    get public_vtuber_communities_search_url
    assert_response :success
  end
end
