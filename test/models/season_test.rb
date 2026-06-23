require "test_helper"

class SeasonTest < ActiveSupport::TestCase
  setup do
    @season = Season.create!(name: "Season 1", year: 2024, active: true)
    @aurochs = Team.create!(name: "Besaid Aurochs", city: "Besaid", color: "#00b4d8")
    @goers = Team.create!(name: "Luca Goers", city: "Luca", color: "#C0392B")
    @psyches = Team.create!(name: "Al Bhed Psyches", city: "Home", color: "#E67E22")
  end

  def create_match(home_team:, away_team:, home_score:, away_score:, days_ago: 1)
    Match.create!(
      season: @season, home_team:, away_team:, home_score:, away_score:, played_at: days_ago.days.ago,
    )
  end

  test "sort by points descending" do
    create_match(home_team: @aurochs, away_team: @goers, home_score: 3, away_score: 1)
    create_match(home_team: @psyches, away_team: @aurochs, home_score: 2, away_score: 0)

    top = @season.standings.first[:team]
    assert_equal @psyches, top
  end

  test "tracks goals for and against correctly" do
    create_match(home_team: @aurochs, away_team: @goers, home_score: 2, away_score: 0)
    rows = @season.standings.index_by { |r| r[:team].id }

    assert_equal 2, rows[@aurochs.id][:goals_for]
    assert_equal 0, rows[@aurochs.id][:goals_against]
    assert_equal 0, rows[@goers.id][:goals_for]
    assert_equal 2, rows[@goers.id][:goals_against]
  end

  test "draw gives 1 point to each team" do
    create_match(home_team: @aurochs, away_team: @goers, home_score: 1, away_score: 1)
    rows = @season.standings.index_by { |r| r[:team].id }

    assert_equal 1, rows[@aurochs.id][:points]
    assert_equal 1, rows[@goers.id][:points]
  end

  test "win gives 3 points to winner, 0 to loser" do
    create_match(home_team: @aurochs, away_team: @goers, home_score: 3, away_score: 2)
    rows = @season.standings.index_by { |r| r[:team].id }

    assert_equal 3, rows[@aurochs.id][:points]
    assert_equal 0, rows[@goers.id][:points]
  end

  test "year must be unique" do
    duplicate = Season.new(name: "Season 2", year: 2024)
    assert_not duplicate.valid?
    assert_includes duplicate.errors.full_messages, "Year has already been taken"
  end

  test "active scope returns the active season" do
    Season.create!(name: "Season 2", year: 2023, active: false)
    assert_equal @season, Season.active
  end
end
