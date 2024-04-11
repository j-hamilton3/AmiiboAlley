class AddForeignKeys < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :amiibos, :amiibo_series
    add_foreign_key :amiibos, :characters
    add_foreign_key :amiibos, :game_series
    add_foreign_key :customers, :provinces, column: :provinceId
    add_foreign_key :order_amiibos, :orders, column: :orderId
    add_foreign_key :order_amiibos, :amiibos, column: :amiiboId
    add_foreign_key :orders, :customers, column: :customerId
  end
end
