class Match < ApplicationRecord
  belongs_to :season
  belongs_to :home_team, class_name: "Team"
  belongs_to :away_team, class_name: "Team"

  validates :home_score, :away_score, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :played_at, presence: true
  validate :teams_must_differ

  scope :recent, -> { order(played_at: :desc) }
  scope :for_season, ->(season) { where(season:) }

  after_create_commit :broadcast_match_logged

  private

  def teams_must_differ
    if home_team_id == away_team_id
      errors.add(:away_team, "must be different from home team")
    end
  end

  def broadcast_match_logged
    season = Season.active
    standings = season.standings
    matches = Match.for_season(season)
                   .includes(:home_team, :away_team)
                   .recent
                   .limit(10)

    ActionCable.server.broadcast("matches", {
      standings_html: ApplicationController.render(
        partial: "league/standings_rows",
        locals: { standings: }
      ),
      results_html: ApplicationController.render(
        partial: "league/match_cards",
        locals: { matches: }
      )
    })
  end
end
