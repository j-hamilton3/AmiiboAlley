require 'csv'

# Delete all the files in the DB.
Amiibo.delete_all
AmiiboSeries.delete_all
Character.delete_all
GameSeries.delete_all

# List of filenames
file_paths = [
  Rails.root.join("db/Smash.csv"),
  Rails.root.join("db/Splatoon.csv"),
  Rails.root.join("db/Zelda.csv"),
  Rails.root.join("db/MonsterHunter.csv"),
  Rails.root.join("db/Mario.csv"),
  Rails.root.join("db/Kirby.csv"),
  Rails.root.join("db/FireEmblem.csv"),
  Rails.root.join("db/AnimalCrossing.csv")
]

puts "Adding Amiibos..."

file_paths.each do |path|
  puts "File path #{path}"
  CSV.foreach(path, headers: true, encoding: "utf-8") do |row|
    amiibo_series = AmiiboSeries.create(name: row["amiibo/amiiboSeries"])
    game_series = GameSeries.create(name: row["amiibo/gameSeries"])
    character = Character.create(name: row["amiibo/character"])
    amiibo = Amiibo.create(name: row["amiibo/"])
  end
end

puts "Created #{Amiibo.count} Amiibos."
