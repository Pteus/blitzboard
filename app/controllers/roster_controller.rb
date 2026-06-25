class RosterController < ApplicationController
  def free_agents
    @players = Player.free_agents.order(:name)
  end
end
