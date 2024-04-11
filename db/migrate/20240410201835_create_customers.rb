class CreateCustomers < ActiveRecord::Migration[7.1]
  def change
    create_table :customers do |t|
      t.string :fullName
      t.string :username
      t.string :password
      t.string :city
      t.string :postalCode
      t.integer :provinceId

      t.timestamps
    end
  end
end
