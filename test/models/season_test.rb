require "test_helper"

class SeasonTest < ActiveSupport::TestCase
  test "year must be unique" do
    Season.create!(name: "Season 1", year: 2024)
    duplicate = Season.new(name: "Season 2", year: 2024)
    assert_not duplicate.valid?
    assert_includes duplicate.errors.full_messages, "Year has already been taken"
  end

  test "active scope returns the active season" do
    season1 = Season.create!(name: "Season 1", year: 2024, active: true)
    season2 = Season.create!(name: "Season 2", year: 2023, active: false)
    assert_equal season2, Season.active
  end
end
