require "test_helper"

class LeagueControllerTest < ActionDispatch::IntegrationTest
  setup do
    @season = Season.create!(name: "Season 1", year: 2024, active: true)
  end

  test "should get index" do
    get root_path
    assert_response :success
  end
end
