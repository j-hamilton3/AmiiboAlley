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
  puts "Adding data from path: #{path}"
  CSV.foreach(path, headers: true, encoding: "utf-8") do |row|
    amiibo_series = AmiiboSeries.find_or_create_by(name: row["amiibo/amiiboSeries"])
    game_series = GameSeries.find_or_create_by(name: row["amiibo/gameSeries"])
    character = Character.find_or_create_by(name: row["amiibo/character"])
    price = Faker::Number.between(from: 10.00, to: 40.00)
    amiibo = Amiibo.create(name: row["amiibo/name"],
                           release_date: row["amiibo/release/na"],
                           image: row["amiibo/image"],
                           amiibo_series_id: amiibo_series.id,
                           game_series_id: game_series.id,
                           character_id: character.id,
                           price: price)
  end
end

puts "**********************************"
puts "CREATED:"
puts "*** #{Amiibo.count} Amiibos."
puts "*** #{AmiiboSeries.count} Amiibo Series."
puts "*** #{GameSeries.count} Game Series."
puts "*** #{Character.count} Characters."
