class Order < ApplicationRecord
  belongs_to :user
  has_many :order_amiibos

  validates :orderDate, presence: true
  validates :user_id, presence: true, numericality: true
  validates :status, presence: true
  validates :total, numericality: true, allow_nil: true
  validates :stripe_id, uniqueness: true, allow_nil: true

  enum status: {
    new_status: 'new',
    paid: 'paid',
    shipped: 'shipped'
  }

  def self.ransackable_associations(auth_object = nil)
    ["order_amiibos", "user"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "orderDate", "status", "stripe_id", "total", "updated_at", "user_id"]
  end
end
