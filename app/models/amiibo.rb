class Amiibo < ApplicationRecord
  validates :name, presence: true
  validates :release_date, length: {maximum: 25}, allow_blank: true
  validates :amiibo_series_id, presence: true, numericality: true
  validates :game_series_id, presence: true, numericality: true
  validates :character_id, presence: true, numericality: true
  validates :price, presence: true, numericality: true

  belongs_to :amiibo_series
  belongs_to :game_series
  belongs_to :character
end
