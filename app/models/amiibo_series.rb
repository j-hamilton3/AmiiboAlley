class AmiiboSeries < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
