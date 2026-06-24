require "test_helper"

class Admin::MatchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    post admin_login_url, params: { password: ENV.fetch("ADMIN_PASSWORD", "password") }
  end

  test "should get new" do
    get new_admin_match_url
    assert_response :success
  end
end
