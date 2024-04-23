class RemoveCustomerModelAndUpdateOrders < ActiveRecord::Migration[7.1]
  def change
    # Remove the customerId column and add the userId column
    remove_column :orders, :customerId
    add_reference :orders, :user, null: false, foreign_key: true

    # Drop the customers table
    drop_table :customers
  end
end
