class OrderAmiibo < ApplicationRecord
  belongs_to :amiibos
  belongs_to :orders

  validates :quantity, presence: true, numericality: true
  validates :unitPrice, presence: true, numericality: true
  validates :orderId, presence: true, numericality: true
  validates :amiiboId, presence: true, numericality: true

end
