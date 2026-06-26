require "test_helper"

class BulkMatchesTest < ActiveSupport::TestCase
  setup do
    @season = Season.create!(name: "Season 1", year: 2024, active: true)
    @aurochs = Team.create!(name: "Besaid Aurochs", city: "Besaid", color: "#00b4d8")
    @goers = Team.create!(name: "Luca Goers", city: "Luca", color: "#C0392B")
  end

  def csv(*rows)
    ([ "home_team,away_team,home_score,away_score,date" ] + rows).join("\n")
  end
end
