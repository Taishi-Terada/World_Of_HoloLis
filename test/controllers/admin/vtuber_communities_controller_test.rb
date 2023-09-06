require "test_helper"

class Admin::VtuberCommunitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_vtuber_communities_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_vtuber_communities_show_url
    assert_response :success
  end

  test "should get search" do
    get admin_vtuber_communities_search_url
    assert_response :success
  end
end
