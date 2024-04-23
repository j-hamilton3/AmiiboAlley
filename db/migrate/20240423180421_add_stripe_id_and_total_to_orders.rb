class AddStripeIdAndTotalToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :stripe_id, :string
    add_column :orders, :total, :decimal, precision: 10, scale: 2
  end
end
