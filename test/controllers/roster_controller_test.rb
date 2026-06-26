require "test_helper"

class RosterControllerTest < ActionDispatch::IntegrationTest
  test "should get free_agents" do
    get agents_path
    assert_response :success
  end
end
