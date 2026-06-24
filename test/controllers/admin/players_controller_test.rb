require "test_helper"

class Admin::PlayersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team = Team.create!(name: "Besaid Aurochs", city: "Besaid", color: "#00b4d8")
    @player = Player.create!(name: "Tidus", team: @team)
    post admin_login_url, params: { password: ENV.fetch("ADMIN_PASSWORD", "test") }
  end

  test "index lists players" do
    get admin_players_url
    assert_response :success
  end

  test "creates a player" do
    assert_difference("Player.count") do
      post admin_players_url, params: { player: { name: "Wakka", level: 1,
                                                  sh: 17, pa: 5, bl: 4, en: 5, sp: 50, at: 6, team: @team } }
    end
    assert_redirected_to admin_players_path
  end
end
