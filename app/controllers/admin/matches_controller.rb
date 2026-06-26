class Admin::MatchesController < Admin::BaseController
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

  def bulk_new
  end

  # TODO: I'm parsing the csv twice, there has to be a better way to do this
  def bulk_create
    raw = params[:raw_csv]
    @valid, @invalid = BulkMatches.parse(raw)
    @raw_csv = raw

    if params[:confirm] && @valid.any?
      BulkMatches.insert_all(@valid, Season.active)
      redirect_to admin_teams_path, notice: "#{@valid.count} matches imported."
    else
      render :bulk_preview
    end
  end

  private

  def match_params
    params.require(:match).permit(:home_team_id, :away_team_id, :home_score, :away_score, :played_at)
  end
end
