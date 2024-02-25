class Character < ApplicationRecord
  has_many :amiibos

  validates :name, presence: true, uniqueness: true
end
