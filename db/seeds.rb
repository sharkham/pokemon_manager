# Add seed data here. Seed your database with `rake db:seed`

# Example from another lab:

# sophie = Owner.create(name: "Sophie")
# Pet.create(name: "Maddy", owner: sophie)
# Pet.create(name: "Nona", owner: sophie)
libris = User.create(username: "libris", email: "libris@umbreon.com", password: "libris")
meryl = User.create(username: "Meryl", email: "meryl@totodile.com", password: "meryl")
samcat = User.create(username: "Samcat", email: "samcat@meow.com", password: "samcat")

# Pokemon.create(nickname: "Bulby", user: libris)
# Pokemon.create(nickname: "Ivy", user: libris)
# Pokemon.create(nickname: "Pika", user: meryl)
# Pokemon.create(nickname: "Mew", user: meryl)
# Pokemon.create(nickname: "Clone", user: chewie)
# Pokemon.create(nickname: "Streep", user: meryl)

# libris.save
# meryl.save
# chewie.save

###

species_list = Scraper.scrape_list_page


species_list.each do |species_name|
  Species.create(name: species_name)
end

#this method works in pry. Need to do a thing to
#exclude duplicate names tho
Species.all.each_with_index do |species, index|
  pokemon_name = species.name
  hash = Scraper.scrape_pokemon_page(pokemon_name)
  species.description = hash[:description]
  species.pokemon_type = hash[:type]
  species.number = hash[:number]
  species.save


  # wait_threshold = 10
  # if index > wait_threshold && index % wait_threshold == 0
  #   sleep 20
  # end
end


bulby = Pokemon.create(nickname: "Bulby", user: libris)
bulbasaur = Species.find_by(name: "Bulbasaur")
bulby.species = bulbasaur
bulby.save

ivy = Pokemon.create(nickname: "Ivy", user: libris)
ivysaur = Species.find_by(name: "Ivysaur")
ivy.species = ivysaur
ivy.save

pika = Pokemon.create(nickname: "Pika", user: meryl)
pikachu = Species.find_by(name: "Pikachu")
pika.species = pikachu
pika.save

meww = Pokemon.create(nickname: "Mew", user: samcat)
mew = Species.find_by(name: "Mew")
meww.species = mew
meww.save

clone = Pokemon.create(nickname: "Clone", user: samcat)
mewtwo = Species.find_by(name: "Mewtwo")
clone.species = mewtwo
clone.save

streep = Pokemon.create(nickname: "Streep", user: meryl)
chikorita = Species.find_by(name: "Chikorita")
streep.species = chikorita
streep.save

libris.save
meryl.save
samcat.save
