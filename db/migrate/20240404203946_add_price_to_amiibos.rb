class AddPriceToAmiibos < ActiveRecord::Migration[7.1]
  def change
    add_column :amiibos, :price, :decimal, precision: 4, scale: 2
  end
end
