class PlayersController < ApplicationController
  def show
    # Do we really need the includes here?
    @player = Player.includes(:team).find(params[:id])
    # TODO: rescue when player not found
  end
end
