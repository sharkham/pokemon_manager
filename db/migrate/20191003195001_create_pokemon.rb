class CreatePokemon < ActiveRecord::Migration
  def change
    create_table :pokemon do |t|
      t.string :species
      t.string :nickname
      t.string :type
      t.integer :number
      t.timestamps
    end
  end
end
