module Admin
  class PlayersController < Admin::BaseController
    before_action :set_player, only: %i[ show edit update destroy ]
    before_action :set_teams, except: %i[ index show ]

    # GET /admin/players or /admin/players.json
    def index
      @players = Player.includes(:team).order(:name)
    end

    # GET /admin/players/1 or /admin/players/1.json
    def show
    end

    # GET /admin/players/new
    def new
      @player = Player.new
    end

    # GET /admin/players/1/edit
    def edit
    end

    # POST /admin/players or /admin/players.json
    def create
      @player = Player.new(player_params)

      if @player.save
        redirect_to admin_players_path, notice: "Player was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /admin/players/1 or /admin/players/1.json
    def update
      if @player.update(player_params)
        redirect_to admin_players_path, notice: "Player was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /admin/players/1 or /admin/players/1.json
    def destroy
      @player.destroy!

      redirect_to admin_players_path, notice: "Player was successfully deleted."
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params.expect(:id))
    end

    def set_teams
      @teams = Team.order(:name)
    end

    # Only allow a list of trusted parameters through.
    def player_params
      params.expect(player: [ :name, :level, :sh, :pa, :bl, :en, :sp, :at, :team_id ])
    end
  end
end
