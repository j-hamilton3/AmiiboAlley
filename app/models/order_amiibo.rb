class OrderAmiibo < ApplicationRecord
  belongs_to :amiibos
  belongs_to :orders
end
