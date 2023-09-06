require "test_helper"

class Public::VtuberInformationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_vtuber_informations_index_url
    assert_response :success
  end

  test "should get show" do
    get public_vtuber_informations_show_url
    assert_response :success
  end

  test "should get search" do
    get public_vtuber_informations_search_url
    assert_response :success
  end
end
