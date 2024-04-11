class Order < ApplicationRecord
  belongs_to :customers
  has_many :order_amiibos

  validates :orderDate, presence: true
  validates :customerId, presence: true, numericality: true
end
