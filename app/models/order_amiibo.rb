class OrderAmiibo < ApplicationRecord
  belongs_to :amiibos
  belongs_to :orders

  validates :quantity, presence: true
end
