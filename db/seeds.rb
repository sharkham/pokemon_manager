# Add seed data here. Seed your database with `rake db:seed`

# Example from another lab:

# sophie = Owner.create(name: "Sophie")
# Pet.create(name: "Maddy", owner: sophie)
# Pet.create(name: "Nona", owner: sophie)
libris = User.create(username: "libris", email: "libris@umbreon.com", password: "libris")
meryl = User.create(username: "Meryl", email: "meryl@totodile.com", password: "meryl")
chewie = User.create(username: "Chewbacca", email: "chewbacca@falcon.com", password: "chewie")

Pokemon.create(species: "", nickname: "", type: "", number: , user: )

# t.string   "species"
# t.string   "nickname"
# t.string   "type"
# t.integer  "number"
# t.datetime "created_at"
# t.datetime "updated_at"
