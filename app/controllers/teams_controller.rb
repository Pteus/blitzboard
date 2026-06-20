class TeamsController < ApplicationController
  def show
    @team = Team.find(params[:id])
    @players = @team.players.order(:name)
  end
end
