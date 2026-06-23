class Season < ApplicationRecord
  has_many :matches

  validates :name, presence: true
  validates :year, presence: true, uniqueness: true

  scope :active, -> { find_by(active: true) }

  def standings
    all_matches = matches.includes(:home_team, :away_team).to_a

    teams = all_matches.flat_map { |m| [ m.home_team, m.away_team ] }.uniq

    rows = teams.index_by(&:id).transform_values do |team|
      { team:, played: 0, wins: 0, draws: 0, losses: 0, goals_for: 0, goals_against: 0 }
    end

    all_matches.each do |match|
      home = rows[match.home_team.id]
      away = rows[match.away_team.id]
      next unless home && away

      home[:played] += 1; away[:played] += 1
      home[:goals_for] += match.home_score; home[:goals_against] += match.away_score
      away[:goals_for] += match.away_score; away[:goals_against] += match.home_score

      if match.home_score > match.away_score
        home[:wins] += 1; away[:losses] += 1
      elsif match.away_score > match.home_score
        away[:wins] += 1; home[:losses] += 1
      else
        home[:draws] += 1; away[:draws] += 1
      end
    end

    rows.values
        .map { |r| r.merge(points: r[:wins] * 3 + r[:draws]) }
        .sort_by { |r| [ -r[:points], -(r[:goals_for] - r[:goals_against]), -r[:goals_for] ] }
  end
end
