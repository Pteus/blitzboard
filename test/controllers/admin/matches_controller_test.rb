require "test_helper"

class Admin::MatchesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_admin_match_url
    assert_response :success
  end
end
