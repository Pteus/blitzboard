# frozen_string_literal: true

class BulkMatches
  def self.parse(raw_text)
    valid = []
    invalid = []
    teams = Team.all.index_by(&:name)

    raw_text.to_s.split("\n").drop(1).each_with_index do |line, index|
      row_num = index + 2 # why?
      parts = line.split(",").map(&:strip) # what?

      unless parts.length == 5
        invalid << { row: row_num, reason: "Expected 5 columns, got #{parts.length}" }
        next
      end

      home_name, away_name, home_score, away_score, date_str = parts
      home = teams[home_name]
      away = teams[away_name]
      errors = []

      errors << "Unknown home team: #{home_name}" unless home
      errors << "Unknown away team: #{away}" unless away
      errors << "Invalid home score" unless home_score.match?(/\A\d+\z/)
      errors << "Invalid away score: #{away_score}" unless away_score.match?(/\A\d+\z/)
      errors << "Away team must be different from home team" unless home != away

      parsed_date = begin
                      DateTime.parse(date_str)
                    rescue ArgumentError
                      errors << "Invalid date: #{date_str}"
                      nil
                    end

      if errors.empty?
        valid << { home_team: home, away_team: away,
                   home_score: home_score.to_i, away_score: away_score.to_i,
                   played_at: parsed_date, row: row_num }
      else
        invalid << { row: row_num, reason: errors.join("; ") }
      end
    end

    [ valid, invalid ]
  end

  def self.insert_all(rows, season)
    Match.transaction do
      rows.each { |attrs| Match.create!(attrs.except(:row).merge(season:)) }
    end
  end
end
