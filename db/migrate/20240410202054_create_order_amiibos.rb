class CreateOrderAmiibos < ActiveRecord::Migration[7.1]
  def change
    create_table :order_amiibos do |t|
      t.integer :quantity
      t.decimal :unitPrice
      t.integer :orderId
      t.integer :amiiboId

      t.timestamps
    end
  end
end
