require "test_helper"

class RosterControllerTest < ActionDispatch::IntegrationTest
  test "should get free_agents" do
    get roster_free_agents_url
    assert_response :success
  end
end
