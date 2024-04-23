class AddTaxRateToOrderAmiibos < ActiveRecord::Migration[7.1]
  def change
    add_column :order_amiibos, :tax_rate, :decimal
  end
end
