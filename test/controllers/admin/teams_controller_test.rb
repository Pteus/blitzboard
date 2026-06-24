require "test_helper"

class Admin::TeamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team = Team.create!(name: "Besaid Aurochs", city: "Besaid", color: "#00b4d8")
    post admin_login_url, params: { password: ENV.fetch("ADMIN_PASSWORD", "password") }
  end

  test "index lists teams" do
    get admin_teams_url
    assert_response :success
  end

  test "creates a team" do
    assert_difference("Team.count") do
      post admin_teams_url, params: { team: { name: "Test FC", city: "Spira", color: "#ffffff" } }
    end
    assert_redirected_to admin_teams_path
  end
end
