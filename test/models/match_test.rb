require "test_helper"

class MatchTest < ActiveSupport::TestCase
  setup do
    @season = Season.create!(name: "Season 1", year: 2024, active: true)
    @aurochs = Team.create!(name: "Besaid Aurochs", city: "Besaid", color: "#00b4d8")
    @goers = Team.create!(name: "Luca Goers", city: "Luca", color: "#C0392B")
  end

  test "home and away team must differ" do
    match = Match.new(
      season: @season, home_team: @aurochs, away_team: @aurochs,
      home_score: 3, away_score: 1, played_at: Time.current
    )
    assert_not match.valid?
    assert_includes match.errors[:away_team], "must be different from home team"
  end

  test "scores must be non-negative" do
    match = Match.new(
      season: @season, home_team: @aurochs, away_team: @goers,
      home_score: -1, away_score: 1, played_at: Time.current
    )
    assert_not match.valid?
  end
end
