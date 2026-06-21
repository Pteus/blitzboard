class CreateMatches < ActiveRecord::Migration[8.1]
  def change
    create_table :matches do |t|
      t.integer :home_score, null: false
      t.integer :away_score, null: false
      t.datetime :played_at, null: false

      t.references :season, null: false, foreign_key: { on_delete: :restrict }

      t.references :home_team, null: false, foreign_key: { to_table: :teams, on_delete: :restrict }

      t.references :away_team, null: false, foreign_key: { to_table: :teams, on_delete: :restrict }

      t.timestamps
    end

    add_check_constraint :matches, "home_team_id != away_team_id", name: "matches_different_teams"
    add_check_constraint :matches, "home_score >= 0 AND away_score >= 0", name: "matches_non_negative_scores"
  end
end
