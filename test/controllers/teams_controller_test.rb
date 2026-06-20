require "test_helper"

class TeamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team = Team.create!(name: "Besaid Aurochs", city: "Besaid", color: "#00b4d8")
  end

  test "should get show" do
    get team_url @team
    assert_response :success
  end
end
