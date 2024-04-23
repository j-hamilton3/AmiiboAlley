class Order < ApplicationRecord
  belongs_to :user
  has_many :order_amiibos

  validates :orderDate, presence: true
  validates :user_id, presence: true, numericality: true

  def self.ransackable_associations(auth_object = nil)
    ["order_amiibos", "user"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "orderDate", "updated_at", "user_id"]
  end
end
