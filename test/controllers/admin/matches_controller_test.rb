require "test_helper"

class Admin::MatchesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_matches_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_matches_create_url
    assert_response :success
  end
end
