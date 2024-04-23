class Order < ApplicationRecord
  belongs_to :users
  has_many :order_amiibos

  validates :orderDate, presence: true
  validates :userId, presence: true, numericality: true
end
