class LeagueController < ApplicationController
  def index
    @season = Season.active
    @standings = @season&.standings || []
    @matches = Match.for_season(@season)
                    .includes(:home_team, :away_team)
                    .recent
                    .limit(10)
  end
end
