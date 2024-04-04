class CreateGameSeries < ActiveRecord::Migration[7.1]
  def change
    create_table :game_series do |t|
      t.string :name

      t.timestamps
    end
  end
end
