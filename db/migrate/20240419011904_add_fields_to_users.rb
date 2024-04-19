class AddFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :postalCode, :string
    add_column :users, :provinceId, :integer
  end
end
