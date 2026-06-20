class Team < ApplicationRecord
  has_many :players, dependent: :nullify

  validates :name, presence: true, uniqueness: true
  validates :city, presence: true
  validates :color, presence: true
end
