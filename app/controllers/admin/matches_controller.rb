class Admin::MatchesController < ApplicationController
  def new
    @match = Match.new
    @teams = Team.order(:name)
  end

  def create
    season = Season.active
    @match = Match.new(match_params.merge(season:))

    if @match.save
      redirect_to matches_path, notice: "Match was successfully logged."
    else
      @teams = Team.order(:name)
      render :new, status: :unprocessable_entity
    end
  end

  private

  def match_params
    params.require(:match).permit(:home_team_id, :away_team_id, :home_score, :away_score, :played_at)
  end
end
