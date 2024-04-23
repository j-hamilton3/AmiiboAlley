class RenameOrderAmiiboColumns < ActiveRecord::Migration[7.1]
  def change
    rename_column :order_amiibos, :orderId, :order_id
    rename_column :order_amiibos, :amiiboId, :amiibo_id
  end
end
