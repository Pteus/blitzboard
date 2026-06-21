class Admin::TeamsController < Admin::BaseController
  before_action :set_team, only: %i[ show edit update destroy ]

  def index
    @teams = Team.all
  end

  # GET /admin/teams/1 or /admin/teams/1.json
  def show
  end

  # GET /admin/teams/new
  def new
    @team = Team.new
  end

  # GET /admin/teams/1/edit
  def edit
  end

  # POST /admin/teams or /admin/teams.json
  def create
    @team = Team.new(team_params)

    if @team.save
      redirect_to admin_teams_path, notice: "Team was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /admin/teams/1 or /admin/teams/1.json
  def update
    if @team.update(team_params)
      redirect_to admin_teams_path, notice: "Team was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /admin/teams/1 or /admin/teams/1.json
  def destroy
    @team.destroy!

    redirect_to admin_teams_path, notice: "Team was successfully deleted."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_team
    @team = Team.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def team_params
    params.expect(team: [ :name, :city, :color ])
  end
end
