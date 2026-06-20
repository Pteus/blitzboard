class Team < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :city, presence: true
  validates :color, presence: true
end
