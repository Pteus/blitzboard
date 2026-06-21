class Season < ApplicationRecord
  has_many :matches
  
  validates :name, presence: true
  validates :year, presence: true, uniqueness: true

  scope :active, -> { find_by(active: true) }
end
