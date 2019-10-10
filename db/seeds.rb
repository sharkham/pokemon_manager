# Add seed data here. Seed your database with `rake db:seed`

libris = User.create(username: "libris", email: "libris@umbreon.com", password: "libris")
meryl = User.create(username: "Meryl", email: "meryl@totodile.com", password: "meryl")
samcat = User.create(username: "Samcat", email: "samcat@meow.com", password: "samcat")


###

species_list = Scraper.scrape_list_page


species_list.each do |species_name|
  Species.create(name: species_name)
end


Species.all.each_with_index do |species, index|
  pokemon_name = species.name
  hash = Scraper.scrape_pokemon_page(pokemon_name)
  species.description = hash[:description]
  species.pokemon_type = hash[:type]
  species.number = hash[:number]
  species.save
end


bulbasaur = Species.find_by(name: "Bulbasaur")
bulby = Pokemon.create(nickname: "Bulby", user: libris, species: bulbasaur)
bulby.save

ivysaur = Species.find_by(name: "Ivysaur")
ivy = Pokemon.create(nickname: "Ivy", user: libris, species: ivysaur)
ivy.save

pikachu = Species.find_by(name: "Pikachu")
pika = Pokemon.create(nickname: "Pika", user: meryl, species: pikachu)
pika.save

mew = Species.find_by(name: "Mew")
meww = Pokemon.create(nickname: "Mew", user: samcat, species: mew)
meww.save

mewtwo = Species.find_by(name: "Mewtwo")
clone = Pokemon.create(nickname: "Clone", user: samcat, species: mewtwo)
clone.save

chikorita = Species.find_by(name: "Chikorita")
streep = Pokemon.create(nickname: "Streep", user: meryl, species: chikorita)
streep.save

libris.save
meryl.save
samcat.save
