class CreatePokemon < ActiveRecord::Migration
  def change
    create_table :pokemon do |t|
      t.string :species
      t.string :nickname
      t.string :pokemon_type
      t.integer :number
      t.integer :user_id
      t.timestamps
    end
  end
end
