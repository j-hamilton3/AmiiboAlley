class AddTaxRateToProvinces < ActiveRecord::Migration[7.1]
  def change
    add_column :provinces, :taxRate, :decimal
  end
end
