class Season < ApplicationRecord
  validates :name, presence: true
  validates :year, presence: true

  scope :active, -> { find_by(active: true) }
end
