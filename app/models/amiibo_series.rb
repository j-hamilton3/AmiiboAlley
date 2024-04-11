class AmiiboSeries < ApplicationRecord
  has_many :amiibos

  validates :name, presence: true, uniqueness: true
  validates :description, length: { maximum: 300 }
end
