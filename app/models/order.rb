class Order < ApplicationRecord
  belongs_to :customers
  has_many :order_amiibos

  validates :orderDate, presence: true
end
