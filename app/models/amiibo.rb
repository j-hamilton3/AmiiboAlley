class Amiibo < ApplicationRecord
  validates :name, presence: true
  validates :release_date, length: {maximum: 25}, allow_blank: true
  validates :amiibo_series_id, presence: true, numericality: true
  validates :game_series_id, presence: true, numericality: true
  validates :character_id, presence: true, numericality: true
  validates :price, presence: true, numericality: true
  validates :image, presence: true

  belongs_to :amiibo_series
  belongs_to :game_series
  belongs_to :character

  def self.ransackable_associations(auth_object = nil)
    ["amiibo_series", "character", "game_series"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["amiibo_series_id", "character_id", "created_at", "game_series_id", "id", "id_value", "image", "name", "price", "release_date", "updated_at"]
  end
end
