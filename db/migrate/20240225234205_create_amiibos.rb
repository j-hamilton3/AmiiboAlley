class CreateAmiibos < ActiveRecord::Migration[7.1]
  def change
    create_table :amiibos do |t|
      t.string :name
      t.datetime :release_date
      t.references :amiibo_series, null: false, foreign_key: true
      t.references :game_series, null: false, foreign_key: true
      t.references :character, null: false, foreign_key: true

      t.timestamps
    end
  end
end
