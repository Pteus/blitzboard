require "test_helper"

class PlayerTest < ActiveSupport::TestCase
  test "stats default to 0 and must be non-negative" do
    player = Player.create!(name: "Tidus")
    assert_equal 0, player.sh

    player.sh = -1
    assert_not player.valid?
  end

  test "team is optional (free agent)" do
    player = Player.new(name: "Nedus")
    assert player.valid?
  end

  test "free_agents scope returns players without a team" do
    @team = Team.create!(name: "Besaid Aurochs", city: "Besaid", color: "#00b4d8")
    Player.create!(name: "Nedus")
    Player.create!(name: "Tidus", team: @team)
    assert_equal [ "Nedus" ], Player.free_agents.pluck(:name)
  end
end
