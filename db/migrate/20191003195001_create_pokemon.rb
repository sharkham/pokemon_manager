class CreatePokemon < ActiveRecord::Migration
  def change
    create_table :pokemon do |t|
      t.string :nickname
      t.text :notes
      t.integer :user_id
      t.integer :species_id
    end
  end
end
