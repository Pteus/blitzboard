class Player < ApplicationRecord
  belongs_to :team, optional: true

  validates :name, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :sh, :pa, :bl, :en, :sp, :at,
            numericality: { greater_than_or_equal_to: 0 }

  scope :free_agents, -> { where(team_id: nil) }
  scope :for_team, ->(team_id) { where(team_id:) }
end
