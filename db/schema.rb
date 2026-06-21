# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_06_20_202458) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "matches", force: :cascade do |t|
    t.integer "away_score", null: false
    t.bigint "away_team_id", null: false
    t.datetime "created_at", null: false
    t.integer "home_score", null: false
    t.bigint "home_team_id", null: false
    t.datetime "played_at", null: false
    t.bigint "season_id", null: false
    t.datetime "updated_at", null: false
    t.index ["away_team_id"], name: "index_matches_on_away_team_id"
    t.index ["home_team_id"], name: "index_matches_on_home_team_id"
    t.index ["season_id"], name: "index_matches_on_season_id"
    t.check_constraint "home_score >= 0 AND away_score >= 0", name: "matches_non_negative_scores"
    t.check_constraint "home_team_id <> away_team_id", name: "matches_different_teams"
  end

  create_table "players", force: :cascade do |t|
    t.integer "at", default: 0, null: false
    t.integer "bl", default: 0, null: false
    t.datetime "created_at", null: false
    t.integer "en", default: 0, null: false
    t.integer "level", default: 1, null: false
    t.string "name", null: false
    t.integer "pa", default: 0, null: false
    t.integer "sh", default: 0, null: false
    t.integer "sp", default: 0, null: false
    t.bigint "team_id"
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.boolean "active"
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.integer "year"
    t.index ["active"], name: "index_seasons_on_active_true", unique: true, where: "(active = true)"
    t.index ["year"], name: "index_seasons_on_year", unique: true
  end

  create_table "teams", force: :cascade do |t|
    t.string "city", null: false
    t.string "color", default: "#00b4d8", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_teams_on_name", unique: true
  end

  add_foreign_key "matches", "seasons", on_delete: :restrict
  add_foreign_key "matches", "teams", column: "away_team_id", on_delete: :restrict
  add_foreign_key "matches", "teams", column: "home_team_id", on_delete: :restrict
  add_foreign_key "players", "teams", on_delete: :nullify
end
