require "test_helper"

class PlayersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @player = Player.create!(name: "Tidus", sh: 13, sp: 70)
  end

  test "should get show" do
    get player_url @player
    assert_response :success
  end
end
