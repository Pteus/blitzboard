require "test_helper"

class TeamTest < ActiveSupport::TestCase
  test "valid with required attributes" do
    team = Team.new(name: "Besaid Aurochs", city: "Besaid", color: "#00b4d8")
    assert team.valid?
  end

  test "invalid without name" do
    team = Team.new(city: "Besaid", color: "#00b4d8")
    assert_not team.valid?
    assert_includes team.errors.full_messages, "Name can't be blank"
  end

  test "invalid without city" do
    team = Team.new(name: "Besaid", color: "#00b4d8")
    assert_not team.valid?
    assert_includes team.errors.full_messages, "City can't be blank"
  end

  test "name must be unique" do
    Team.create!(name: "Besaid Aurochs", city: "Besaid", color: "#00b4d8")
    duplicate = Team.new(name: "Besaid Aurochs", city: "Besaid", color: "#00b4d8")
    assert_not duplicate.valid?
    assert_includes duplicate.errors.full_messages, "Name has already been taken"
  end

  test "color defaults to #00b4d8" do
    team = Team.create!(name: "Test FC", city: "Spira")
    assert_equal "#00b4d8", team.color
  end
end
