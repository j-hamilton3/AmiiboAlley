class Order < ApplicationRecord
  belongs_to :user
  has_many :order_amiibos

  validates :orderDate, presence: true
  validates :user_id, presence: true, numericality: true
  validates :status, presence: true

  enum status: {
    new_status: 'new',
    paid: 'paid',
    shipped: 'shipped',
    cancelled: 'cancelled'
  }

  def self.ransackable_associations(auth_object = nil)
    ["order_amiibos", "user"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "orderDate", "status", "updated_at", "user_id"]
  end
end
