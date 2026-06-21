class MatchesController < ApplicationController
  def index
    season = Season.active
    @matches = Match.for_season(season&.id)
                    .includes(:home_team, :away_team)
                    .recent
  end
end
