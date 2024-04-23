class OrderAmiibo < ApplicationRecord
  belongs_to :amiibos
  belongs_to :orders

  validates :quantity, presence: true, numericality: true
  validates :unitPrice, presence: true, numericality: true
  validates :orderId, presence: true, numericality: true
  validates :amiiboId, presence: true, numericality: true

  def self.ransackable_attributes(auth_object = nil)
    ["amiiboId", "created_at", "id", "id_value", "orderId", "quantity", "unitPrice", "updated_at"]
  end
end
