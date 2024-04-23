class OrderAmiibo < ApplicationRecord
  belongs_to :amiibo
  belongs_to :order

  validates :quantity, presence: true, numericality: true
  validates :unitPrice, presence: true, numericality: true
  validates :order_id, presence: true, numericality: true
  validates :amiibo_id, presence: true, numericality: true
  validates :tax_rate, presence: true, numericality: true

  def self.ransackable_attributes(auth_object = nil)
    ["amiibo_id", "created_at", "id", "id_value", "order_id", "quantity", "unitPrice", "tax_rate", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["amiibo", "order"]
  end
end
