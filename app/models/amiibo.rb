class Amiibo < ApplicationRecord
  validates :name, presence: true

  belongs_to :amiibo_series
  belongs_to :game_series
  belongs_to :character
end
