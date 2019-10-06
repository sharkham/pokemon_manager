# Add seed data here. Seed your database with `rake db:seed`

# Example from another lab:

# sophie = Owner.create(name: "Sophie")
# Pet.create(name: "Maddy", owner: sophie)
# Pet.create(name: "Nona", owner: sophie)
libris = User.create(username: "libris", email: "libris@umbreon.com", password: "libris")
meryl = User.create(username: "Meryl", email: "meryl@totodile.com", password: "meryl")
chewie = User.create(username: "Chewbacca", email: "chewbacca@falcon.com", password: "chewie")

Pokemon.create(species: "Bulbasaur", nickname: "Bulby", pokemon_type: "Grass - Poison", number: 1, user: libris)
Pokemon.create(species: "Ivysaur", nickname: "Ivy", pokemon_type: "Grass - Poison", number: 2, user: libris)
Pokemon.create(species: "Pikachu", nickname: "Pika", pokemon_type: "Electric", number: 25, user: meryl)
Pokemon.create(species: "Mew", nickname: nil, pokemon_type: "Psychic", number: 151, user: meryl)
Pokemon.create(species: "Mewtwo", nickname: "Clone", pokemon_type: "Psychic", number: 150, user: chewie)
Pokemon.create(species: "Chikorita", nickname: "Streep", pokemon_type: "Grass", number: 152, user: meryl)

# t.string   "species"
# t.string   "nickname"
# t.string   "type"
# t.integer  "number"
# t.integer  "user_id"
# t.datetime "created_at"
# t.datetime "updated_at"
