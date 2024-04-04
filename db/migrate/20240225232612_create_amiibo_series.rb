class CreateAmiiboSeries < ActiveRecord::Migration[7.1]
  def change
    create_table :amiibo_series do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
