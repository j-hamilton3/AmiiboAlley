class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.datetime :orderDate
      t.integer :customerId

      t.timestamps
    end
  end
end
